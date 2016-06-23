def fibSeq(n)

 a = [0]

 n.times do |i|
   if i==0
     a[i] = 0
   elsif i==1
     a[i] = 1
   else
     a[i] = a[i-1] + a[i-2]
   end  
 end

 return a[n-1]
end

puts fibSeq(4)