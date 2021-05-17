package com.insung.isup.common.util;

/**
 * @(#) ObjectStore.java
 *
 * NOTICE !      You can copy or redistribute this code freely,
 * but you should not remove the information about the copyright notice
 * and the author.
 *
 * @author  WonYoung Lee, javaservice@hanmail.net
 * 2000.09.05. 문자열을 받아들이는 로직에서 '(single quotation)을 ''(single quotation 2개)로 변환.
 *             <= SQL문에 실제 '을 입력하고자 할 때 ''여야 함.
 * 2001.04.10. '(single quotation)을 ''(single quotation 2개)로 변환하지 않음.
 * 2001.04.11. getClass 호출시 null 체크 로직 삽입
 */
//JDF Package
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.Vector;
//import com.lib.common.logs.Logger;

@SuppressWarnings({ "serial", "rawtypes" })
public class ObjectStore extends HashMap {
	protected String name = null;
	
	public ObjectStore() { 
	  super();
  }


	public ObjectStore(String name) {
		super();
		this.name = name;
	}
	
  public String getName() {
		return this.name;
	}  
	/**
     *
     * @param target com.lib.common.servlet.ObjectStore
     */
    @SuppressWarnings("unchecked")
	public Object clone() {
		  ObjectStore newObjectStore = new ObjectStore(name);

		  HashMap src = (HashMap)this;
		  HashMap target = (HashMap)newObjectStore;

      Set set = src.keySet();
		  Iterator e = set.iterator();

		while(e.hasNext()) {
			String key = (String) e.next();
			Object value =  src.get(key);
			target.put(key,value);
		}

		return newObjectStore;
    }

	/**
	 * copy INPUT FORM field to Entity's member variable.
	 * <p>
     * 자동으로 box에 들어 있는 자료들 중에서 Entity Class에
     * 동일한 Field가 있으면 그 Field의 Type에 맞게 값을 자동으로 대입시켜 준다.
     * 만약 특별한 Field가 있다면 그것만 추가로 수정한다.
	 * <p>
	 *
     * @param entity java.lang.Object
     */
    public void copyToEntity(Object entity) {
    	if ( entity == null )
    		throw new NullPointerException("Using ERROR] : Trying to copy to null entity class");

    	Class c = entity.getClass();
    	Field[] field = c.getFields();
    	for (int i=0 ; i<field.length; i++) {
    		try {
    			String fieldtype = field[i].getType().getName();
    			String fieldname = field[i].getName();

    			if ( containsKey( fieldname ) ) {
    				if ( fieldtype.equals("java.lang.String")) {
    					field[i].set(entity, getString(fieldname));
    				}
    				else if ( fieldtype.equals("int")) {
    					field[i].setInt(entity, getInt(fieldname));
    				}
    				else if ( fieldtype.equals("double")) {
    					field[i].setDouble(entity, getDouble(fieldname));
    				}
    				else if ( fieldtype.equals("long")) {
    					field[i].setLong(entity, getLong(fieldname));
    				}
    				else if ( fieldtype.equals("float")) {
    					field[i].set(entity, new Float(getDouble(fieldname)));
    				}
    				else if ( fieldtype.equals("boolean")) {
    					field[i].setBoolean(entity, getBoolean(fieldname));
    				}
    			}
    		}
    		catch(Exception e){
    			System.out.println(e.getMessage());
    		}
            Utility.fixNull(entity);
     	}
    }

    /**
     *
     * @param entity java.lang.Object
     */
    @SuppressWarnings("unchecked")
	public Vector copyToEntities(Object entity) throws Exception{

        Vector v = new Vector();
    	  Class c = entity.getClass();
        try {
        	  Field[] field = c.getFields();
            for ( int h = 0; h<getArray("key").length; h++) {
                int index = Integer.parseInt(getArray("key")[h]);
                entity = c.newInstance();
            	for (int i=0 ; i<field.length; i++) {
        			String fieldtype = field[i].getType().getName();
        			String fieldname = field[i].getName();

        			if ( containsKey( fieldname ) ) {
        				if ( fieldtype.equals("java.lang.String")) {
                            try {
            					field[i].set(entity, getArray(fieldname)[index]);
                            }catch(Exception e) { field[i].set(entity,""); }
        				}
        				else if ( fieldtype.equals("int")) {
                            try {
            					field[i].setInt(entity,
                                   (int)((Double.valueOf(getArray(fieldname)[index])).doubleValue()));
                            }catch(Exception e) { field[i].setInt(entity,0); }
        				}
        				else if ( fieldtype.equals("double")) {
                            try {
            					field[i].setDouble(entity,
                                   (Double.valueOf(getArray(fieldname)[index])).doubleValue());
                            }catch(Exception e) { field[i].setDouble(entity,0); }
        				}
        				else if ( fieldtype.equals("long")) {
                            try {
            					field[i].setLong(entity,
                                   (long)((Double.valueOf(getArray(fieldname)[index])).doubleValue()));
                            }catch(Exception e) { field[i].setLong(entity,0); }
        				}
        				else if ( fieldtype.equals("float")) {
                            try {
            					field[i].setFloat(entity,
                                   (float)((Double.valueOf(getArray(fieldname)[index])).doubleValue()));
                            }catch(Exception e) { field[i].setFloat(entity,0); }
        				}
        				else if ( fieldtype.equals("boolean")) {
        					field[i].setBoolean(entity,
                                (new Boolean(getArray(fieldname)[index])).booleanValue());
        				}
        			}
        		}
                Utility.fixNull(entity);
                v.addElement(entity);
            }
    	}catch(Exception e){ throw new Exception("<key> FORM tag must be declared!"); }
        return v;
    }

	/**
	 * @return java.lang.String
	 * @param key java.lang.String
	 */
	public String get(String key) {
		return getString(key);
	}

	/**
	 * @return java.lang.String
	 * @param key java.lang.String
	 */
	public boolean getBoolean(String key) {
		String value = getString(key);
		boolean isTrue = false;
		try {
			isTrue = (new Boolean(value)).booleanValue();
		}
		catch(Exception e){}
		return isTrue;
	}
	/**
	 * @return java.lang.String
	 * @param key java.lang.String
	 */
	public double getDouble(String key) {
		String value = removeComma(getString(key));
		if ( value.equals("") ) return 0;
		double num = 0;
		try {
			num = Double.valueOf(value).doubleValue();
		}
		catch(Exception e) {
			num = 0;
		}
		return num;
	}

	/**
	 * @return java.lang.String
	 * @param key java.lang.String
	 */
	public double getFloat(String key) {
		return (float)getDouble(key);
	}
	/**
	 * @return java.lang.String
	 * @param key java.lang.String
	 */
	public int getInt(String key) {
		double value = getDouble(key);
		return (int)value;
	}
	/**
	 * @return java.lang.String
	 * @param key java.lang.String
	 */
	public long getLong(String key) {
		String value = removeComma(getString(key));
		if ( value.equals("") ) return 0L;

		long lvalue = 0L;
		try {
			lvalue = Long.valueOf(value).longValue();
		}
		catch(Exception e) {
			lvalue = 0L;
		}

		return lvalue;
	}
	
	public String getString(String key) {
		String value = null;
		try {
			Object o = (Object)super.get(key);
			if ( o == null ) {
				value = "";
			}
			else {
				Class c = o.getClass();
				if( c.isArray() ) {
					int length = Array.getLength(o);
					if ( length == 0 ) value = "";
					else {
						Object item = Array.get(o, 0);
						if ( item == null ) value = "";
						else value = item.toString();
					}
				} else value = o.toString();
			}
		}
		catch(Exception e) {
			value = "";
		}
		return CommonUtil.E2K(value);
	}

	/**
	 * check box 와 같이 같은 name에 대해 여러 value들이 String의 Vector로 넘겨준다.
	 * @return Vector
	 * @param key java.lang.String
	 */
	@SuppressWarnings("unchecked")
	public Vector getVector(String key) {
		Vector vector = new Vector();
		try {
			Object o = (Object)super.get(key);
			if ( o != null ) {
				Class c = o.getClass();
				if( c.isArray() ) {
					int length = Array.getLength(o);
					if ( length != 0 ) {
						for(int i=0; i<length;i++) {
							Object item = Array.get(o, i);
							if (item == null ) vector.addElement("");
							else vector.addElement(CommonUtil.E2K(item.toString()));
						}
					}
				}
				else
					vector.addElement(o.toString());
			}
		}
		catch(Exception e) {}
		return vector;
	}
	/**
	 * check box 와 같이 같은 name에 대해 여러 value들이 String의 Array로 넘겨준다.
	 * @return String[]
	 * @param key java.lang.String
	 */
	public String[] getArray(String key) {
		String[] arr = null;
		try {
			Object o = (Object)super.get(key);
			if ( o != null ) {
				Class c = o.getClass();
				if( c.isArray() ) {
					int length = Array.getLength(o);
					if ( length != 0 ) {
                        arr = new String[length];
						for(int i=0; i<length;i++) {
							Object item = Array.get(o, i);
							if (item == null ) arr[i] = "";
                            else arr[i] = CommonUtil.E2K(item.toString());
						}
					}
				}
				else {
                    arr = new String[1];
                    arr[0] = o.toString();
                }
			}
		}
		catch(Exception e) {}
		return arr;
	}
	/**
	 * @param key java.lang.String
	 * @param value java.lang.String
	 */
	@SuppressWarnings("unchecked")
	public void put(String key, String value) {
		super.put(key, value);
	}

	/**
	 * remove "," in string.
	 * @return java.lang.String
	 * @param s java.lang.String
	 */
	private static String removeComma(String s) {
		if ( s == null ) return null;
		if ( s.indexOf(",") != -1 ) {
			StringBuffer buf = new StringBuffer();
			for(int i=0;i<s.length();i++){
				char c = s.charAt(i);
				if ( c != ',') buf.append(c);
			}
			return buf.toString();
		}
		return s;
	}


public synchronized String toString() {
		int max = size() - 1;
		StringBuffer buf = new StringBuffer();

		// key set
		Set kset = keySet();
		Iterator Keys = kset.iterator();

		// value set
		Set vset = entrySet();
		Iterator values = vset.iterator();

		buf.append("{");

		for (int i = 0; i <= max; i++) {
			String key = (String)Keys.next();
			String value = null;
			Object o = values.next();

			if (o == null) {
				value = "";

			} else {
				Class  c = o.getClass();
				if(c.isArray()) {
					int length = Array.getLength(o);
					if (length == 0) {
						value = "";
					} else if (length == 1) {
						Object item = Array.get(o, 0);
						if ( item == null ) {
							value = "";
						} else {
							value = item.toString();
						} // end if ( item == null )
					} else {
						StringBuffer valueBuf = new StringBuffer();
						valueBuf.append("[");
						for ( int j=0; j<length; j++) {
							Object item = Array.get(o, j);
							if ( item != null ) {
  						   valueBuf.append(CommonUtil.E2K(item.toString()));
							}
							if ( j<length-1) {
								valueBuf.append(",");
							}
						} // end for ( int j=0;j<length;j++)

						valueBuf.append("]");
						value = valueBuf.toString();
					} // end if ( length == 0 )

				} else {
					value = o.toString();
				} // end if( c.isArray() )
			} // end if ( o == null )

		    buf.append(key + "=" + value);
		    if (i < max) {
		    	buf.append(", ");
		    }
		} // end for (int i = 0; i <= max; i++)
	    buf.append("}");

		return "Objectstore["+name+"]=" + buf.toString();
    }
  
}
