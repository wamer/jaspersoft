import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.LayoutManager;
import java.awt.Point;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.BoxLayout;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;
import javax.xml.transform.Templates;

import net.sf.dynamicreports.adhoc.AdhocManager;
import net.sf.dynamicreports.adhoc.configuration.AdhocColumn;
import net.sf.dynamicreports.adhoc.configuration.AdhocConfiguration;
import net.sf.dynamicreports.adhoc.configuration.AdhocReport;
import net.sf.dynamicreports.adhoc.report.DefaultAdhocReportCustomizer;
import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.builder.ReportBuilder;
import net.sf.dynamicreports.report.exception.DRException;
import net.sf.dynamicreports.adhoc.configuration.AdhocCalculation;
import net.sf.dynamicreports.adhoc.configuration.AdhocGroup;
import net.sf.dynamicreports.adhoc.configuration.AdhocSort;
import net.sf.dynamicreports.adhoc.configuration.AdhocSubtotal;
import net.sf.dynamicreports.report.datasource.DRDataSource;
import net.sf.dynamicreports.report.definition.datatype.DRIDataType;
import net.sf.jasperreports.engine.JRDataSource;
import com.mysql.jdbc.DatabaseMetaData;
import com.mysql.jdbc.Statement;
import net.sf.dynamicreports.examples.*;

public class MiniProjectRefined extends JFrame {
			
        private int currentCard = 1;
        private JPanel cardPanel;
        private CardLayout cl;
        private Connection conn = null;
        private final ArrayList<String> tables = new ArrayList<String>();
    	private ArrayList<JCheckBox> chk = new ArrayList<JCheckBox>();
    	private ArrayList<JCheckBox> chk1 = new ArrayList<JCheckBox>();
    	private JLabel lab3 = new JLabel("Choose Columns for Aggregate Functions");
    	private ArrayList<String> tablechk = new ArrayList<String>();
    	private ArrayList<String> col = new ArrayList<String>();
    	private String aggfunc = new String(" ");
    	private ArrayList<String> groupCol = new ArrayList<String>();
    	private ArrayList<JRadioButton> groupByCol = new ArrayList<JRadioButton>();
    	private ArrayList<JCheckBox> aggcol = new ArrayList<JCheckBox>();
    	private ButtonGroup btngrp = new ButtonGroup();
    	private JRadioButton sum,avg,max,min;
    	private String GroupByCol = new String("");
    	private  JComboBox comb;
    	private final JTextField txt = new JTextField("");
    	private JRadioButton desc;
    	public boolean join_possible = false;
    	public String first_col = "";
    	public String second_col = "";
    	final JPanel p3 = new JPanel();  //panel 3 for group by and columns
    	final JPanel p3a = new JPanel();
    	final JPanel p3b = new JPanel();
    	final JPanel p3c = new JPanel();
    	final JPanel p3final = new JPanel();
    	
        public MiniProjectRefined() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {

                //Shiraj
        	
        		setTitle("Dynamic Web Report Generator Tool");
                setSize(300, 150);
                cardPanel = new JPanel();
                
                

                cl = new CardLayout();
                cardPanel.setLayout(cl);   //Card Panel for displaying different panels
                
                
                JPanel p1 = new JPanel();  //panel 1 for tables
                final JPanel p2 = new JPanel();  //panel 2 for columns
                
                	
                final JPanel p4 = new JPanel();  //panel 4 for order by clause
                final JPanel p5 = new JPanel();  //panel 5 for setting title of the report
                
                
                //Establishing the database connection
                String url = "jdbc:mysql://localhost:3306/";
                String dbName = "pl";
                String driver = "com.mysql.jdbc.Driver";
                String userName = "root";
                String password = "ctrls.123";
                Class.forName(driver).newInstance();
                conn = DriverManager.getConnection(url+dbName,userName,password);
                
                //Get tables from the database
                final DatabaseMetaData md = (DatabaseMetaData) conn.getMetaData();
                
                final ResultSet rs = md.getTables(null, null, "%", null);
                
                int count = 0;
                
              //count number of tables
                while(rs.next())
                {
                	tables.add(rs.getString(3));
                	count++;
                }
                
                //Array of checkboxes for the tables to be displayed
                for(int i=1;i <= count;i++)
        		{
        			JCheckBox temp = new JCheckBox(tables.get(i-1));
        			chk.add(temp); 
        		}
                
                for(int i=0;i<chk.size();i++)
        		{
        			p1.add(chk.get(i));
        		}
           
                
                p1.setBorder(new TitledBorder("Choose Tables"));
                p1.setLayout(new BoxLayout(p1,BoxLayout.Y_AXIS));
                JScrollPane spanel = new JScrollPane(p1);
                spanel.setMinimumSize(new Dimension(400,500));
                spanel.setPreferredSize(new Dimension(400,500));
                
                p2.setBorder(new TitledBorder("Choose Columns"));
                p2.setLayout(new BoxLayout(p2, BoxLayout.Y_AXIS));
                JScrollPane npanel = new JScrollPane(p2);
                npanel.setMinimumSize(new Dimension(400,500));
                npanel.setPreferredSize(new Dimension(400,500));
                
                
                p3.setBorder(new TitledBorder("Choose Aggregate Function"));
                p3a.setLayout(new BoxLayout(p3a, BoxLayout.Y_AXIS));
                p3b.setLayout(new BoxLayout(p3b, BoxLayout.Y_AXIS));
                p3final.setLayout(new BoxLayout(p3final, BoxLayout.X_AXIS));
                p3c.setLayout(new BoxLayout(p3c, BoxLayout.Y_AXIS));
                p3.setLayout(new BoxLayout(p3, BoxLayout.Y_AXIS));
                JScrollPane tpanel = new JScrollPane(p3);
                tpanel.setMinimumSize(new Dimension(400,500));
                tpanel.setPreferredSize(new Dimension(400,500));
                
                p4.setBorder(new TitledBorder("Choose columns to order by"));
                
                p5.setBorder(new TitledBorder("Set title of the Report"));
                p5.setLayout(new BoxLayout(p5, BoxLayout.Y_AXIS));
                
                cardPanel.add(spanel, "1");
                cardPanel.add(npanel, "2");
                cardPanel.add(tpanel, "3");
                cardPanel.add(p4, "4");
                cardPanel.add(p5,"5");
                JPanel buttonPanel = new JPanel();
                JButton b1 = new JButton("Previous");
                final JButton b2 = new JButton("Next");
                buttonPanel.add(b1);
                buttonPanel.add(b2);
                b1.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent arg0) {
                                if (currentCard > 1) {
                                        currentCard -= 1;
                                        cl.show(cardPanel, "" + (currentCard));
                                }
                                if(currentCard == 1)
                                {
                                	if(!tablechk.isEmpty())
                                		tablechk.clear();
                                	for(JCheckBox c : chk)
                                	{
                                		if(c.isSelected())
                                			c.setSelected(false);
                                	}
                                	//System.out.println(tablechk.get(0));
                                }
                                if(currentCard == 2)
                                {
                                	for(JCheckBox c : chk1)
                                	{
                                		if(c.isSelected())
                                			c.setSelected(false);
                                	}
                                		
                                	
                                }
                                
                        }
                });

                b2.addActionListener(new ActionListener() {
                        public void actionPerformed(ActionEvent arg0) {
                        	if (currentCard < 5) {
                                currentCard += 1;
                                cl.show(cardPanel, "" + (currentCard));
                        	}
                        	//button for displaying columns for the selected tables
                            if(currentCard == 2){
                            	
                            	
                            	//Pratyush
                                	
                            	int cnt = 0;
                                	 //panel displaying the columns of the selected tables
                            		Component[] comp = p2.getComponents();
                            		if(comp.length > 0)
                            		{
                            			p2.removeAll();
                            		}
                                    
                            		String query = new String("select * from ");
                                    for(JCheckBox check : chk){
                    					if(check.isSelected())
                    					{
                    						String[] val = check.toString().split(",");
                    			        	String check1 = val[val.length-1];
                    			        	int sPos = check1.indexOf("=");
                    			        	int lPos = check1.indexOf("]");
                    			        	StringBuilder res = new StringBuilder(); 
                    			        	for(int i = sPos+1;i<lPos;i++)
                    			        	{
                    			        		res.append(check1.charAt(i));	
                    			        	}
                    			        	tablechk.add(res.toString());	//tablechk for the storing tables that are checked
                    			        	
                    			        	/*check to see if the two tables have any field in common*/
                    			        	
                    			        	
                    			        	cnt++;
                    			        	
                    			        	
                    			        	query = query +  res.toString() + ",";
                    					}
                    				}
                                    
                                    
                                    
                                    if(cnt == 2) // if user selected two tables
                                    {
	                                    System.out.println(tablechk.get(0) + " " +tablechk.get(1));
	            			        	DatabaseMetaData dm = null;
	            			        	ArrayList<String> foreign_keys = new ArrayList<String>();
	            			        	ArrayList<String> table_columns = new ArrayList<String>();
	            			        	try {
											dm = (DatabaseMetaData) conn.getMetaData();
											try {
												ResultSet check_tables =  dm.getExportedKeys(conn.getCatalog(), "", tablechk.get(1));
												while(check_tables.next())
												{
													foreign_keys.add(check_tables.getString("FKCOLUMN_NAME")) ;
												}
												
												String other_table = tablechk.get(0);
												ResultSet rs = null;
												Statement st = null;
												try {
													st = (Statement) conn.createStatement();
												} catch (SQLException e2) {
													
													e2.printStackTrace();
												}
												
												rs = st.executeQuery("select * from " + other_table);
												ResultSetMetaData rsmd = null;
												
												rsmd = rs.getMetaData();
												System.out.println(rsmd.getColumnCount() + " " + foreign_keys.size());
												for(int i=1;i<=rsmd.getColumnCount();i++)
												{
													table_columns.add(rsmd.getColumnLabel(i));
												}
												
												for(int i=0;i<foreign_keys.size();i++)
												{
													for(int j=0;j<table_columns.size();j++)
													{
													//	System.out.println(rsmd.getColumnLabel(j) + " " + foreign_keys.get(i));
														if(table_columns.get(j).equals(foreign_keys.get(i)))
														{
															join_possible = true;
															first_col = table_columns.get(j);
															System.out.println(first_col);
															
															ResultSet ab = dm.getImportedKeys(conn.getCatalog(), "", other_table);
															while(ab.next())
															{
																second_col = ab.getString(4);
															}
															break;
														}
													}
													if(join_possible)
														break;
												}
												
											} catch (SQLException e1) {
												e1.printStackTrace();
											}
										} catch (SQLException e) {
											
											
											
											e.printStackTrace();
										}
                                    }
            			        	
                    				int idx = query.lastIndexOf(",");
                    				if(idx == -1)
                    					JOptionPane.showMessageDialog(p2, "Choose Tables");
                    				else
                    				{
                    					query = query.substring(0,idx);
                        				ResultSet resultSet = null;
                        				Statement stmt = null;
                        				try {
                        					stmt = (Statement) conn.createStatement();
                        				} catch (SQLException f) {
                        					
                        					f.printStackTrace();
                        				}
                        				try {
                        					resultSet = stmt.executeQuery(query);
                        				} catch (SQLException e1) {
                        					
                        					e1.printStackTrace();
                        				}
                        				java.sql.ResultSetMetaData md1 = null;
                        				try {
                        					md1 = resultSet.getMetaData();
                        				} catch (SQLException e) {
                        					// TODO Auto-generated catch block
                        					e.printStackTrace();
                        				}
                        				try {
                        					for(int i=1;i<=md1.getColumnCount();i++)
                        					{
                        						JCheckBox c = new JCheckBox(md1.getColumnLabel(i));
                        						chk1.add(c);
                        						p2.add(c);
                        					}
                        				} catch (SQLException e) {
                        					// TODO Auto-generated catch block
                        					e.printStackTrace();
                        				}
                    				}
                    				
                                }
                           if(currentCard == 3)
                           {
                        	   
                        	   
                        	   //Shradha
                        	   
                        	   
                        	   int count = 0;
                        	   for(Component c : p2.getComponents() )
                        	   {
                        		   if(c instanceof JCheckBox )
                        		   {
                        			   if(((JCheckBox)c).isSelected())
                        				   count++;
                        		   }
                        			   
                        	   }
                        	   if(count == 0)
                        	   {
                        		   p3.removeAll();
                        		   JOptionPane.showMessageDialog(p3, "Choose Columns");
                        	   }
                        	   else
                        	   {
                        		   Component[] comp = p3.getComponents();
                            	   if(comp.length == 0)
                            	   {
                                	   
                                	   
                                	   sum = new JRadioButton("Sum");
                                	   sum.addItemListener(myListener);
                                	   btngrp.add(sum);
                                	   p3a.add(sum);
                                	   avg = new JRadioButton("Average");
                                	   avg.addItemListener(myListener);
                                	   btngrp.add(avg);
                                	   p3a.add(avg);
                                	   max = new JRadioButton("Maximum");
                                	   max.addItemListener(myListener);
                                	   btngrp.add(max);
                                	   p3a.add(max);
                                	   min = new JRadioButton("Minimum");
                                	   min.addItemListener(myListener);
                                	   btngrp.add(min);
                                	   p3a.add(min);
                                	   
                                	   JLabel lab = new JLabel("Choose Columns to Group By");
                                	   p3c.add(lab);
                                	   String query = new String("select * from ");
                                       for(JCheckBox check : chk){
                       					if(check.isSelected())
                       					{
                       						String[] val = check.toString().split(",");
                       			        	String check1 = val[val.length-1];
                       			        	int sPos = check1.indexOf("=");
                       			        	int lPos = check1.indexOf("]");
                       			        	StringBuilder res = new StringBuilder(); 
                       			        	for(int i = sPos+1;i<lPos;i++)
                       			        	{
                       			        		res.append(check1.charAt(i));
                       			        	}
                       			        	query = query +  res.toString() + ",";
                       					}
                       				}
                       				int idx = query.lastIndexOf(",");
                       				if(idx == -1)
                       					JOptionPane.showMessageDialog(p2, "Choose Tables");
                       				else
                       				{
                       					query = query.substring(0,idx);
                           				ResultSet resultSet = null;
                           				Statement stmt = null;
                           				try {
                           					stmt = (Statement) conn.createStatement();
                           				} catch (SQLException f) {
                           					
                           					f.printStackTrace();
                           				}
                           				try {
                           					resultSet = stmt.executeQuery(query);
                           				} catch (SQLException e1) {
                           					
                           					e1.printStackTrace();
                           				}
                           				java.sql.ResultSetMetaData md1 = null;
                           				try {
                           					md1 = resultSet.getMetaData();
                           				} catch (SQLException e) {
                           					// TODO Auto-generated catch block
                           					e.printStackTrace();
                           				}
                           				try {
                           					for(int i=1;i<=md1.getColumnCount();i++)
                           					{
                           						JCheckBox c = new JCheckBox(md1.getColumnLabel(i));
                           						aggcol.add(c);
                           						p3c.add(c);
                           					}
                           				} catch (SQLException e) {
                           					// TODO Auto-generated catch block
                           					e.printStackTrace();
                           				}
                       				}
                           				
               						  
                                	   p3b.add(lab3);
               						query = "select * from ";
                                       for(JCheckBox check : chk){
                       					if(check.isSelected())
                       					{
                       						String[] val = check.toString().split(",");
                       			        	String check1 = val[val.length-1];
                       			        	int sPos = check1.indexOf("=");
                       			        	int lPos = check1.indexOf("]");
                       			        	StringBuilder res = new StringBuilder(); 
                       			        	for(int i = sPos+1;i<lPos;i++)
                       			        	{
                       			        		res.append(check1.charAt(i));
                       			        	}
                       			        	query = query +  res.toString() + ",";
                       					}
                       					}
                                	idx = query.lastIndexOf(",");
                                	query = query.substring(0,idx);
                       				ResultSet resultSet = null;
                       				Statement stmt = null;
                       				try {
                       					stmt = (Statement) conn.createStatement();
                       				} catch (SQLException f) {
                       					
                       					f.printStackTrace();
                       				}
                       				try {
                       					resultSet = stmt.executeQuery(query);
                       				} catch (SQLException e1) {
                       					
                       					e1.printStackTrace();
                       				}
                       				java.sql.ResultSetMetaData md1 = null;
                       				try {
                       					md1 = resultSet.getMetaData();
                       					int numInts = 0;
                       					int numCol = md1.getColumnCount();
                       					for(int i=1;i<=numCol;i++)
                       					{
                       						if(((ResultSetMetaData) md1).getColumnTypeName(i).equals("INT"))
                       						{
                       							JRadioButton c = new JRadioButton(md1.getColumnLabel(i));
                       							groupByCol.add(c);
                       							p3b.add(c);
                       							numInts++;
                       						}
                       					}
                       					if(numInts == 0)
                       						JOptionPane.showMessageDialog(p3, "No Columns of type int selected");
                       				} catch (SQLException e) {
                       					// TODO Auto-generated catch block
                       					e.printStackTrace();
                       				}
                                   }
                                
                        	   }
                        	   		p3final.add(p3a);
                        	   		p3.add(p3final);
                                    p3.add(p3c);
                        	   }
                          
                           if(currentCard == 4)
                           {   
                        	   Component[] comp = p4.getComponents();
                        	   if(comp.length > 0)
                        	   {
                        		   p4.removeAll();
                        	   }
                        	   if(sum.isSelected())
                        		   aggfunc = "sum";
                        	   if(avg.isSelected())
                        		   aggfunc = "avg";
                        	   if(max.isSelected())
                        		   aggfunc = "max";
                        	   if(min.isSelected())
                        		   aggfunc = "min";
                        	   
                        	   for(JRadioButton x : groupByCol){
                        		   if(x.isSelected())
                        		   {
                        			   String[] val = x.toString().split(",");
                  			        	String check1 = val[val.length-1];
                  			        	int sPos = check1.indexOf("=");
                  			        	int lPos = check1.indexOf("]");
                  			        	StringBuilder res = new StringBuilder(); 
                  			        	for(int i = sPos+1;i<lPos;i++)
                  			        	{
                  			        		res.append(check1.charAt(i));
                  			        		GroupByCol += res.toString() + " ";
                  			        	}
                        		   }
                        	   }
                        	   
                        		   Vector<String> order = new Vector<String>();
                        		   order.add(" ");
                        		   for(Component component : p2.getComponents()) {
             						  if(component instanceof JCheckBox) {
             						    if(((JCheckBox)component).isSelected())
             						    {
             						    	String[] val = component.toString().split(",");
             					        	String check1 = val[val.length-1];
             					        	int sPos = check1.indexOf("=");
             					        	int lPos = check1.indexOf("]");
             					        	StringBuilder res = new StringBuilder(); 
             					        	for(int i = sPos+1;i<lPos;i++)
             					        	{
             					        		res.append(check1.charAt(i));
             					        	}
             					        	order.add(res.toString());
             						    }
             						  }
             						}
                        		 comb = new JComboBox(order);
                        		  p4.add(comb);
                        		  desc = new JRadioButton("Descending");
                        		 p4.add(desc);
                        	   }
                           
                        	 if(currentCard == 5)
                        	 {                    		 
                        	   
                        		//Abhishek
                        		 
                        	    Component[] comp = p5.getComponents();
                          	   if(comp.length == 0)
                          	   {
                          		 JPanel mainpanel = new JPanel();
                          		 mainpanel.setLayout(new FlowLayout());
                          		 JLabel lab = new JLabel("Title of the report");
 
                        		 txt.setPreferredSize(new Dimension(120,20));
                        		 JButton btn = new JButton("Generate Report");
                        		 
                        		 btn.addActionListener(new ActionListener() {
									
									@Override
									public void actionPerformed(ActionEvent arg0) {
										
										if(txt.getText().equals(""))
											JOptionPane.showMessageDialog(p5, "Please add the title of the report");
										
										else
										{
											AdhocConfiguration configuration = new AdhocConfiguration();
											AdhocReport report = new AdhocReport();
											configuration.setReport(report); 
											StringBuilder res = new StringBuilder();
											StringBuilder columns = new StringBuilder();
											//columns
											for(int i=0;i<chk1.size();i++)
										    {
										    	if(chk1.get(i).isSelected())
										    	{
										    		
										    		String[] val = chk1.get(i).toString().split(",");
										        	String check = val[val.length-1];
										        	int sPos = check.indexOf("=");
										        	int lPos = check.indexOf("]");
										        	res = new StringBuilder();
										        	for(int j = sPos+1;j<lPos;j++)
										        		res.append(check.charAt(j));
										        	col.add(res.toString());
										        	columns.append(res.toString() + ",");
										    	}
										    }
											
											String sql = "select ";
											res = new StringBuilder("");
											
											for(int i=0;i<tablechk.size();i++)
											{
												
												res.append(tablechk.get(i));
												res.append(",");
											}
											String tab = new String();
											int idx = res.toString().lastIndexOf(",");
			                            	tab = res.toString().substring(0,idx);
			                            	
			                            	String fcol = "";
			                            	
			                            	if(columns.length() > 0)
			                            		fcol = columns.substring(0, columns.length() - 1);
											
			                            	
			                            	
			                            	String temp = comb.getSelectedItem().toString();
										  	
			                            	
			                            	
			                            	String acol = new String(); 
			                            	if(!aggfunc.equals(" "))
			                            	{
			                            		for(JRadioButton r : groupByCol)
			                            		{
			                            			if(r.isSelected())
			                            			{
			                            				String[] val = r.toString().split(",");
											        	String check = val[val.length-1];
											        	int sPos = check.indexOf("=");
											        	int lPos = check.indexOf("]");
											        	//System.out.println(r);
											        	acol = check.substring(sPos+1, lPos);
											        	//System.out.println(acol);
			                            			}
			                            		}
			                            		String groupColumns = new String();
			                            		res = new StringBuilder();
				                            	for(JCheckBox c : aggcol)
				                            	{
				                            		if(c.isSelected())
				                            		{
				                            			String[] val = c.toString().split(",");
											        	String check = val[val.length-1];
											        	int sPos = check.indexOf("=");
											        	int lPos = check.indexOf("]");
											        	res.append(check.substring(sPos + 1,lPos) + ",");
				                            		}
				                            	}
				                            	idx = res.toString().lastIndexOf(",");
				                            	
				                            	if(res.toString().length() > 0)
				                            		groupColumns = res.toString().substring(0,idx);
				                            	
				                            	//System.out.println(groupColumns);
				                            	AdhocColumn column = new AdhocColumn();
				                            	column.setName(aggfunc + "(" + acol + ")");
				                            	report.addColumn(column);
				                            	
				                            	if(join_possible){
				                            		sql = sql + aggfunc + "(" + acol + ")" + " " + fcol + " from " + tab + " where " + first_col + " = " + second_col; 
				                            	sql =  sql + " group by " + groupColumns;
				                            	}
				                            	else
				                            	{
					                            	sql = sql + aggfunc + "(" + acol + ")" + "," + fcol + " from " + tab + " group by " + groupColumns;
				                            	}
				                            	
			                            	}
			                            	else
			                            	{
			                            		sql = sql + " " + fcol + " from " + tab;
			                         
			                            		if(join_possible)
			                            			sql = sql + " where " + first_col + " = " + second_col; 
			                            	}
			                            	AdhocColumn column;
											for(int i=0;i<col.size();i++)
											{
												column = new AdhocColumn();
												column.setName(col.get(i));
												report.addColumn(column);
											}
			                            	if(!temp.equals(" "))
			                            	{
			                            		if(desc.isSelected())
			                            			sql = sql + " order by " + temp + " desc";
			                            		else
			                            			sql = sql + " order by " + temp;
			                            		
			                            	}
			                            	System.out.println(sql);
											  	
			                            	JDialog jd;
											JasperReportBuilder reportBuilder = null;
												try {
													jd = new JDialog();
													reportBuilder = AdhocManager.createReport(configuration.getReport(),new ReportsCustomizer());
													//jd.add((Component)reportBuilder);
													
												} catch (DRException e) {
													// TODO Auto-generated catch block
													e.printStackTrace();
												}
												reportBuilder.setDataSource(sql, conn);
												try {
													reportBuilder.show();
												} catch (DRException e) {
													// TODO Auto-generated catch block
													e.printStackTrace();
												}
										}
										
										
									}
								});
                        		 mainpanel.add(lab);
                        		 mainpanel.add(txt);
                        		 mainpanel.add(btn);
                        		 p5.add(mainpanel);
                          	   }
                        		 
                        	 }
                             
                        }
                });
                getContentPane().add(cardPanel, BorderLayout.NORTH);
                getContentPane().add(buttonPanel, BorderLayout.SOUTH);
                this.setSize(1000,1000);
                this.setVisible(true);
                
        }

        public static void main(String[] args) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
                /*MiniProjectRefined cl = new MiniProjectRefined();	
                cl.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                cl.setVisible(true);*/
        }
        
        //Report Customization
        
        
        public class ReportsCustomizer extends DefaultAdhocReportCustomizer{
        	public void customize(ReportBuilder<?> report, AdhocReport adhocReport) throws DRException {
        		super.customize(report, adhocReport);
    			
        		String val = txt.getText();
    			report.setTemplate(net.sf.dynamicreports.examples.Templates.reportTemplate);
    			report.title(net.sf.dynamicreports.examples.Templates.createTitleComponent(val));
    			
    			//a fixed page footer that user cannot change, this customization is not stored in the xml file
    			report.pageFooter(net.sf.dynamicreports.examples.Templates.footerComponent);
        }
        }
        
        
        private ItemListener myListener = new ItemListener()
        {
			@Override
			public void itemStateChanged(ItemEvent e) {
				if(e.getStateChange() == ItemEvent.SELECTED)
				{
					p3final.add(p3b);
					p3final.revalidate();
				}
				else
				{
					p3final.remove(p3b);
					p3final.revalidate();
				}	
			}
        };
}


