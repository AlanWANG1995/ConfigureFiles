def decrypt(p, q, N, bs):
  res = bytearray(bs)
  index = 0
  count = 0
  tail=0
  while True:
    if index < q:
      index = N - (q-index)
    elif index >= q and index < N-p:
      index = index - q + p
    else:
      index = p - (N - index)
    if bs[count] != b'\x00':
      res[index] = bs[count];
    else:
      tail += 1;
    count += 1
    if index == 0:
      break   
  if tail > 0:
      res = res[:tail]
  return res

def main_decr(p,q,N,url):
  import requests
  f = requests.get(url)
  con = f.text
  # f = open(url, "r")
  # con = f.read()
  dcon = base64.b64decode(con)
  print(dcon)
  with open("decodes", "wb") as f2:
    for i in range(len(dcon)//N):
      mdcon = decrypt(p,q,N,dcon[i*N:i*N+N])
      f2.write(mdcon)
  f.close()

if __name__ == "__main__":
  import sys
  import base64
  args = sys.argv[1:]
  if len(args) != 4:
    raise TypeError("argument should be 3")
  main_decr(int(args[0]), int(args[1]), int(args[2]), args[3])
