
# terraform-aws-guardduty-organization

## lambda

```mermaid

```

## region

```mermaid
%%tfmermaid:region
%%{init:{"theme":"default","themeVariables":{"lineColor":"#6f7682","textColor":"#6f7682"}}}%%
flowchart LR
classDef r fill:#5c4ee5,stroke:#444,color:#fff
classDef v fill:#eeedfc,stroke:#eeedfc,color:#5c4ee5
classDef ms fill:none,stroke:#dce0e6,stroke-width:2px
classDef vs fill:none,stroke:#dce0e6,stroke-width:4px,stroke-dasharray:10
classDef ps fill:none,stroke:none
classDef cs fill:#f7f8fa,stroke:#dce0e6,stroke-width:2px
subgraph "n0"["EventBridge"]
n1["aws_cloudwatch_event_rule.<br/>guardduty"]:::r
n2["aws_cloudwatch_event_target.<br/>guardduty"]:::r
end
class n0 cs
subgraph "n3"["GuardDuty"]
n4["aws_guardduty_detector.admin"]:::r
n5["aws_guardduty_detector.master"]:::r
n6["aws_guardduty_filter.admin"]:::r
n7["aws_guardduty_ipset.admin"]:::r
n8["aws_guardduty_member.admin"]:::r
n9["aws_guardduty_organization_admin_account.<br/>master"]:::r
na["aws_guardduty_organization_configuration.<br/>admin"]:::r
nb["aws_guardduty_threatintelset.<br/>admin"]:::r
end
class n3 cs
subgraph "nc"["KMS (Key Management)"]
nd["aws_kms_alias.guardduty"]:::r
ne["aws_kms_key.guardduty"]:::r
end
class nc cs
subgraph "nf"["Lambda"]
ng["aws_lambda_permission.<br/>guardduty"]:::r
end
class nf cs
subgraph "nh"["SNS (Simple Notification)"]
ni["aws_sns_topic.guardduty"]:::r
nj["aws_sns_topic_policy.<br/>guardduty"]:::r
nk["aws_sns_topic_subscription.<br/>guardduty"]:::r
end
class nh cs
subgraph "nl"["STS (Security Token)"]
nm{{"data.<br/>aws_caller_identity.<br/>admin"}}:::r
end
class nl cs
subgraph "nn"["IAM (Identity & Access Management)"]
no{{"data.<br/>aws_iam_policy_document.<br/>guardduty"}}:::r
np{{"data.<br/>aws_iam_policy_document.<br/>key"}}:::r
end
class nn cs
subgraph "nq"["Organizations"]
nr{{"data.<br/>aws_organizations_organization.<br/>master"}}:::r
end
class nq cs
ns[/"provider<br/>[&quot;registry.terraform.io/hashicorp/aws&quot;]"\]
nt[/"provider<br/>[&quot;registry.terraform.io/hashicorp/aws&quot;].<br/>lambda"\]
nu[/"provider<br/>[&quot;registry.terraform.io/hashicorp/aws&quot;].<br/>master"\]
subgraph "nv"["Input Variables"]
nw(["var.aws_region"]):::v
nx(["var.parameters"]):::v
end
class nv vs
ny(["local.<br/>finding_publishing_frequency"]):::v
nz(["local.filters"]):::v
n10(["local.s3"]):::v
n11(["local.accounts"]):::v
n12(["local.admin_account_id"]):::v
n13(["local.lambda"]):::v
ns-->n1
n1-->n2
ni-->n2
ny-->n4
ns-->n4
ny-->n5
nu-->n5
n4-->n6
nz-->n6
n4-->n7
n10-->n7
n5-->n8
na-->n8
n11-->n8
n4-->n9
n12-->n9
nu-->n9
n9-->na
n4-->nb
n10-->nb
ne-->nd
np-->ne
ni-->ng
nt-->ng
nd-->ni
no-->nj
ni-->nk
n13-->nk
ns-->nm
ni-->no
nm-->np
nu-->nr
nr-->n11
n12-->n11
nm-->n12
nx--->nz
nx--->ny
nx--->n13
nx--->n10
n2-->ns
n6-->ns
n7-->ns
n8-->ns
nb-->ns
nj-->ns
nk-->ns
nw--->ns
nx--->ns
ng-->nt
n13-->nt
n5-->nu
n9-->nu
nr-->nu
nw--->nu
nx--->nu
```

