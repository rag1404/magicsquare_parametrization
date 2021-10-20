class magicsquare #(int p, int q);
  
  rand bit [7:0] a [0:q][0:q];
  constraint c1 {
    foreach(a[i]) {
      a[i].sum with (int'(item)) == p;          // rows
      a.sum with (int'(a[item.index][i]))== p; // cols
    }
      a.sum with (int'(a[item.index][item.index])) ==p; // diag1
    a.sum with (int'(a[item.index][($size(a)-1)-item.index])) ==p; // diag2
  }
 
  // 00 01 02 03
  // 10 11 12 13
  // 20 21 22 23
  
  function void display ();
                 $display ("The value of array is %p",a);
 
  endfunction
endclass
 
module test;
  magicsquare #(34,3)m1;
  initial begin
    m1=new();
    assert(m1.randomize());
    m1.display();
  end
endmodule
