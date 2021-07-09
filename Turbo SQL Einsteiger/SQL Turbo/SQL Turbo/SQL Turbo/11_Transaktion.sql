--TX

begin tran

delete from kunden where id = 49

select * from kunden where id = 49

rollback --commit jetzt fix drin

select * from kunden where id = 49

