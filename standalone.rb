

#=============================================# OUTPUT #============================================================#
def revalue_hash(a_hash)
  b_hash = a_hash.sort.group_by { |k, v| v }.each_with_object(Hash.new) { |(k, v), h| h[v.map { |e| e.first }.join(', ')] = k }
  b_hash.keys.each do |bk, _| # USER
    if b_hash[bk]
      c_hash = b_hash[bk]
      c_hash.keys.each do |ck, _| # DOMAIN
        if c_hash[ck]
          d_hash = c_hash[ck]
          d_hash.keys.each do |dk, _| # NODE
            if d_hash[dk].first then else d_hash.delete(dk) end
          end
          if not d_hash.empty?
            c_hash[ck] = d_hash.sort.group_by { |k, v| v }.each_with_object(Hash.new) { |(k, v), h| h[v.map { |e| e.first }.join(', ')] = k }
            if c_hash[ck].count == 1 then c_hash[ck]["All Nodes:"] = c_hash[ck].delete(c_hash[ck].keys.first) end
          else
            c_hash.delete(ck)
          end
        else
          c_hash.delete(ck)
        end
      end
      if not c_hash.empty?
        b_hash[bk] = c_hash.sort.group_by { |k, v| v }.each_with_object(Hash.new) { |(k, v), h| h[v.map { |e| e.first }.join(', ')] = k }
      else
        b_hash.delete(bk)
      end
    else
      b_hash.delete(bk)
    end
  end
  return b_hash
end
