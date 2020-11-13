// ORM class for table 'aps_order_amount_pay'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Fri Nov 13 13:47:10 CST 2020
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

public class aps_order_amount_pay extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("dt", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        dt = (String)value;
      }
    });
    setters.put("payment_channel", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        payment_channel = (String)value;
      }
    });
    setters.put("pay_status", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        pay_status = (String)value;
      }
    });
    setters.put("total_amount", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        total_amount = (java.math.BigDecimal)value;
      }
    });
  }
  public aps_order_amount_pay() {
    init0();
  }
  private String dt;
  public String get_dt() {
    return dt;
  }
  public void set_dt(String dt) {
    this.dt = dt;
  }
  public aps_order_amount_pay with_dt(String dt) {
    this.dt = dt;
    return this;
  }
  private String payment_channel;
  public String get_payment_channel() {
    return payment_channel;
  }
  public void set_payment_channel(String payment_channel) {
    this.payment_channel = payment_channel;
  }
  public aps_order_amount_pay with_payment_channel(String payment_channel) {
    this.payment_channel = payment_channel;
    return this;
  }
  private String pay_status;
  public String get_pay_status() {
    return pay_status;
  }
  public void set_pay_status(String pay_status) {
    this.pay_status = pay_status;
  }
  public aps_order_amount_pay with_pay_status(String pay_status) {
    this.pay_status = pay_status;
    return this;
  }
  private java.math.BigDecimal total_amount;
  public java.math.BigDecimal get_total_amount() {
    return total_amount;
  }
  public void set_total_amount(java.math.BigDecimal total_amount) {
    this.total_amount = total_amount;
  }
  public aps_order_amount_pay with_total_amount(java.math.BigDecimal total_amount) {
    this.total_amount = total_amount;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof aps_order_amount_pay)) {
      return false;
    }
    aps_order_amount_pay that = (aps_order_amount_pay) o;
    boolean equal = true;
    equal = equal && (this.dt == null ? that.dt == null : this.dt.equals(that.dt));
    equal = equal && (this.payment_channel == null ? that.payment_channel == null : this.payment_channel.equals(that.payment_channel));
    equal = equal && (this.pay_status == null ? that.pay_status == null : this.pay_status.equals(that.pay_status));
    equal = equal && (this.total_amount == null ? that.total_amount == null : this.total_amount.equals(that.total_amount));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof aps_order_amount_pay)) {
      return false;
    }
    aps_order_amount_pay that = (aps_order_amount_pay) o;
    boolean equal = true;
    equal = equal && (this.dt == null ? that.dt == null : this.dt.equals(that.dt));
    equal = equal && (this.payment_channel == null ? that.payment_channel == null : this.payment_channel.equals(that.payment_channel));
    equal = equal && (this.pay_status == null ? that.pay_status == null : this.pay_status.equals(that.pay_status));
    equal = equal && (this.total_amount == null ? that.total_amount == null : this.total_amount.equals(that.total_amount));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.dt = JdbcWritableBridge.readString(1, __dbResults);
    this.payment_channel = JdbcWritableBridge.readString(2, __dbResults);
    this.pay_status = JdbcWritableBridge.readString(3, __dbResults);
    this.total_amount = JdbcWritableBridge.readBigDecimal(4, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.dt = JdbcWritableBridge.readString(1, __dbResults);
    this.payment_channel = JdbcWritableBridge.readString(2, __dbResults);
    this.pay_status = JdbcWritableBridge.readString(3, __dbResults);
    this.total_amount = JdbcWritableBridge.readBigDecimal(4, __dbResults);
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
    JdbcWritableBridge.writeString(dt, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(payment_channel, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(pay_status, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(total_amount, 4 + __off, 3, __dbStmt);
    return 4;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeString(dt, 1 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(payment_channel, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(pay_status, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(total_amount, 4 + __off, 3, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.dt = null;
    } else {
    this.dt = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.payment_channel = null;
    } else {
    this.payment_channel = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.pay_status = null;
    } else {
    this.pay_status = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.total_amount = null;
    } else {
    this.total_amount = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.dt) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, dt);
    }
    if (null == this.payment_channel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, payment_channel);
    }
    if (null == this.pay_status) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, pay_status);
    }
    if (null == this.total_amount) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.total_amount, __dataOut);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.dt) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, dt);
    }
    if (null == this.payment_channel) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, payment_channel);
    }
    if (null == this.pay_status) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, pay_status);
    }
    if (null == this.total_amount) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.total_amount, __dataOut);
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
    __sb.append(FieldFormatter.escapeAndEnclose(dt==null?"null":dt, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(payment_channel==null?"null":payment_channel, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(pay_status==null?"null":pay_status, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(total_amount==null?"null":total_amount.toPlainString(), delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(dt==null?"null":dt, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(payment_channel==null?"null":payment_channel, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(pay_status==null?"null":pay_status, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(total_amount==null?"null":total_amount.toPlainString(), delimiters));
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
    if (__cur_str.equals("\\N")) { this.dt = null; } else {
      this.dt = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.payment_channel = null; } else {
      this.payment_channel = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.pay_status = null; } else {
      this.pay_status = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.total_amount = null; } else {
      this.total_amount = new java.math.BigDecimal(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.dt = null; } else {
      this.dt = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.payment_channel = null; } else {
      this.payment_channel = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N")) { this.pay_status = null; } else {
      this.pay_status = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("\\N") || __cur_str.length() == 0) { this.total_amount = null; } else {
      this.total_amount = new java.math.BigDecimal(__cur_str);
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    aps_order_amount_pay o = (aps_order_amount_pay) super.clone();
    return o;
  }

  public void clone0(aps_order_amount_pay o) throws CloneNotSupportedException {
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("dt", this.dt);
    __sqoop$field_map.put("payment_channel", this.payment_channel);
    __sqoop$field_map.put("pay_status", this.pay_status);
    __sqoop$field_map.put("total_amount", this.total_amount);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("dt", this.dt);
    __sqoop$field_map.put("payment_channel", this.payment_channel);
    __sqoop$field_map.put("pay_status", this.pay_status);
    __sqoop$field_map.put("total_amount", this.total_amount);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
