USE BikeStores

-- ------------------------------------------------
-- Joining tables to create dataset needed to complete analysis


Select
	o.order_id,
	CONCAT(c.first_name,' ',c.last_name) as 'customers',
	c.city,
	c.state,
	o.order_date,
	sum(ite.quantity) as total_units,
	sum(ite.quantity * ite.list_price) as 'reveune',
	pp.product_name,
	pc.category_name,
	st.store_name,
	CONCAT(stf.first_name,' ',stf.last_name) as sales_rep,
	br.brand_name
From sales.orders o
Join sales.customers c
	on o.customer_id = c.customer_id
Join sales.order_items ite
	on o.order_id = ite.order_id
Join production.products pp
	on ite.product_id = pp.product_id
Join production.categories pc
	on pp.category_id = pc.category_id
Join sales.stores st
	on o.store_id = st.store_id
Join sales.staffs stf
	on o.staff_id = stf.staff_id
Join production.brands br
	on pp.brand_id = br.brand_id
GROUP BY o.order_id, CONCAT(c.first_name,' ',c.last_name), c.city, c.state, o.order_date, pp.product_name, pc.category_name, st.store_name, CONCAT(stf.first_name,' ',stf.last_name), br.brand_name
	;
-- ------------------------------------------------------------------

-- ----------------
