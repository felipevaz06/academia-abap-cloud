@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view para resolução do exercicio 03'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_FABAP_EXER03_FVF 
        as select from /dmo/customer as Customer
{
    key Customer.customer_id as CustomerId,
    concat_with_space(Customer.first_name, Customer.last_name, 1)  as Full_Name,
    
    concat_with_space(
    concat_with_space(
    concat_with_space(
    concat(
        Customer.street, ', '
        ), Customer.city, 1), '-', 1
        ), Customer.country_code, 1
        )
        as Full_Address
}
