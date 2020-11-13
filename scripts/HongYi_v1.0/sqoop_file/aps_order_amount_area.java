// ORM class for table 'aps_order_amount_area'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Fri Nov 13 13:57:34 CST 2020
// For connector: org.apache.sqoop.manager.MySQLManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class aps_order_amount_area extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("py_dt", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        py_dt = (String)value;
      }
    });
    setters.put("province", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        province = (String)value;
      }
    });
    setters.put("city", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        city = (String)value;
      }
    });
    setters.put("area", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        area = (String)value;
      }
    });
    setters.put("total_amount", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        total_amount = (java.math.BigDecimal)value;
      }
    });
    setters.put("cycle", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        cycle = (String)value;
      }
    });
  }
  public aps_order_amount_area() {
    init0();
  }
  private String py_dt;
  public String get_py_dt() {
    return py_dt;
  }
  public void set_py_dt(String py_dt) {
    this.py_dt = py_dt;
  }
  public aps_order_amount_area with_py_dt(String py_dt) {
    this.py_dt = py_dt;
    return this;
  }
  private String province;
  public String get_province() {
    return province;
  }
  public void set_province(String province) {
    this.province = province;
  }
  public aps_order_amount_area with_province(String province) {
    this.province = province;
    return this;
  }
  private String city;
  public String get_city() {
    return city;
  }
  public void set_city(String city) {
    this.city = city;
  }
  public aps_order_amount_area with_city(String city) {
    this.city = city;
    return this;
  }
  private String area;
  public String get_area() {
    return area;
  }
  public void set_area(String area) {
    this.area = area;
  }
  public aps_order_amount_area with_area(String area) {
    this.area = area;
    return this;
  }
  private java.math.BigDecimal total_amount;
  public java.math.BigDecimal get_total_amount() {
    return total_amount;
  }
  public void set_total_amount(java.math.BigDecimal total_amount) {
    this.total_amount = total_amount;
  }
  public aps_order_amount_area with_total_amount(java.math.BigDecimal total_amount) {
    this.total_amount = total_amount;
    return this;
  }
  private String cycle;
  public String get_cycle() {
    return cycle;
  }
  public void set_cycle(String cycle) {
    this.cycle = cycle;
  }
  public aps_order_amount_area with_cycle(String cycle) {
    this.cycle = cycle;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof aps_order_amount_area)) {
      return false;
    }
    aps_order_amount_area that = (aps_order_amount_area) o;
    boolean equal = true;
    equal = equal && (this.py_dt == null ? that.py_dt == null : this.py_dt.equals(that.py_dt));
    equal = equal && (this.province == null ? that.province == null : this.province.equals(that.province));
    equal = equal && (this.city == null ? that.city == null : this.city.equals(that.city));
    equal = equal && (this.area == null ? that.area == null : this.area.equals(that.area));
    equal = equal && (this.total_amount == null ? that.total_amount == null : this.total_amount.equals(that.total_amount));
    equal = equal && (this.cycle == null ? that.cycle == null : this.cycle.equals(that.cycle));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof aps_order_amount_area)) {
      return false;
    }
    aps_order_amount_area that = (aps_order_amount_area) o;
    boolean equal = true;
    equal = equal && (this.py_dt == null ? that.py_dt == null : this.py_dt.equals(that.py_dt));
    equal = equal && (this.province == null ? that.province == null : this.province.equals(that.province));
    equal = equal && (this.city == null ? that.city == null : this.city.equals(that.city));
    equal = equal && (this.area == null ? that.area == null : this.area.equals(that.area));
    equal = equal && (this.total_amount == null ? that.total_amount == null : this.total_amount.equals(that.total_amount));
    equal = equal && (this.cycle == null ? that.cycle == null : this.cycle.equals(that.cycle));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.py_dt = JdbcWritableBridge.readString(1, __dbResults);
    this.province = JdbcWritableBridge.readString(2, __dbResults);
    this.city = JdbcWritableBridge.readString(3, __dbResults);
    this.area = JdbcWritableBridge.readString(4, __dbResults);
    this.total_amount = JdbcWritableBridge.readBigDecimal(5, __dbResults);
    this.cycle = JdbcWritableBridge.readString(6, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.py_dt = JdbcWritableBridge.readString(1, __dbResults);
    this.province = JdbcWritableBridge.readString(2, __dbResults);
    this.city = JdbcWritableBridge.readString(3, __dbResults);
    this.area = JdbcWritableBridge.readString(4, __dbResults);
    this.total_amount = JdbcWritableBridge.readBigDecimal(5, __dbResults);
    this.cycle = JdbcWritableBridge.readString(6, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(py_dt, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(province, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(city, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(area, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(total_amount, 5 + __off, 3, __dbStmt);
    JdbcWritableBridge.writeString(cycle, 6 + __off, 12, __dbStmt);
    return 6;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(py_dt, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(province, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(city, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(area, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(total_amount, 5 + __off, 3, __dbStmt);
    JdbcWritableBridge.writeString(cycle, 6 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.py_dt = null;
    } else {
    this.py_dt = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.province = null;
    } else {
    this.province = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.city = null;
    } else {
    this.city = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.area = null;
    } else {
    this.area = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.total_amount = null;
    } else {
    this.total_amount = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.cycle = null;
    } else {
    this.cycle = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.py_dt) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, py_dt);
    }
    if (null == this.province) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, province);
    }
    if (null == this.city) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, city);
    }
    if (null == this.area) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, area);
    }
    if (null == this.total_amount) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.total_amount, __dataOut);
    }
    if (null == this.cycle) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, cycle);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.py_dt) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, py_dt);
    }
    if (null == this.province) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, province);
    }
    if (null == this.city) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, city);
    }
    if (null == this.area) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, area);
    }
    if (null == this.total_amount) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.total_amount, __dataOut);
    }
    if (null == this.cycle) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, cycle);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(py_dt==null?"null":py_dt, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(province==null?"null":province, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(city==null?"null":city, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(area==null?"null":area, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(total_amount==null?"null":total_amount.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(cycle==null?"null":cycle, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(py_dt==null?"null":py_dt, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(province==null?"null":province, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(city==null?"null":city, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(area==null?"null":area, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(total_amount==null?"null":total_amount.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(cycle==null?"null":cycle, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 9, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.py_dt = null; } else {
      this.py_dt = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.province = null; } else {
      this.province = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.city = null; } else {
      this.city = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.area = null; } else {
      this.area = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.total_amount = null; } else {
      this.total_amount = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.cycle = null; } else {
      this.cycle = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.py_dt = null; } else {
      this.py_dt = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.province = null; } else {
      this.province = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.city = null; } else {
      this.city = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.area = null; } else {
      this.area = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.total_amount = null; } else {
      this.total_amount = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.cycle = null; } else {
      this.cycle = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    aps_order_amount_area o = (aps_order_amount_area) super.clone();
    return o;
  }

  public void clone0(aps_order_amount_area o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("py_dt", this.py_dt);
    __sqoop$field_map.put("province", this.province);
    __sqoop$field_map.put("city", this.city);
    __sqoop$field_map.put("area", this.area);
    __sqoop$field_map.put("total_amount", this.total_amount);
    __sqoop$field_map.put("cycle", this.cycle);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("py_dt", this.py_dt);
    __sqoop$field_map.put("province", this.province);
    __sqoop$field_map.put("city", this.city);
    __sqoop$field_map.put("area", this.area);
    __sqoop$field_map.put("total_amount", this.total_amount);
    __sqoop$field_map.put("cycle", this.cycle);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
