module "component" {
   for_each = var.components
   source = "git::https://github.com/mahesh-ganji9/terraform-roboshop-components.git?ref=main"
   component = each.key
   rule_priority = each.value.rule_priority
   

}