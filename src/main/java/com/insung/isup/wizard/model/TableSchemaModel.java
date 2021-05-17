package com.insung.isup.wizard.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TableSchemaModel {
	private String object_id;		//table object id
	private String table_name;
	private String column_name;
	private String column_type;
	private String column_header;
	private String column_align;
	private int column_length;
	private int column_order;
	private String rpt_id;
	
}