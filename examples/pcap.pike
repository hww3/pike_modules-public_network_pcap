int main()
{
  object p = Public.Network.Pcap.Pcap();
  p->set_promisc(1);
  p->set_capture_length(65400);
  p->open_live(p->lookup_dev());

 p->set_filter("host 172.21.126.48");
 p->set_capture_callback(lambda(mixed a, mixed|void b){write("cb: %O ***", a); });

 while(1)
 write("CAPTURED: " + p->loop(50) + "\n");
  return 0;

}
