; ModuleID = '../data/hip_kernels/12089/1/main.cu'
source_filename = "../data/hip_kernels/12089/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@a1 = protected addrspace(4) externally_initialized global double 0x3FBE12AACA0BCF45, align 8
@a2 = protected addrspace(4) externally_initialized global double 0x3FD6DF62279DAB2A, align 8
@a3 = protected addrspace(4) externally_initialized global double 0x3FE4904EEC312A6B, align 8
@a4 = protected addrspace(4) externally_initialized global double 0x3FEC3DAAA6BE8617, align 8
@b10 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA83AC02427AF96, align 8
@b11 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FB3F4AAC1A59B7D, align 8
@b12 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF84C0D4C79B4445, align 8
@b13 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F67A5696094ACC4, align 8
@b14 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF42385DDF707025, align 8
@b20 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F964D4109BBBC9E, align 8
@b21 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FCCA18876315713, align 8
@b22 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FBF3E88718D97B6, align 8
@b23 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF88C34E57793767, align 8
@b24 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F60211920D3D294, align 8
@b30 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA6FB819D4443D3, align 8
@b31 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC472503BF08020, align 8
@b32 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD4A9A2EFC6D9DA, align 8
@b33 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FBF3E88718D97B6, align 8
@b34 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF7C4FE15A2CDF36, align 8
@b40 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F93CEC3FBF4E518, align 8
@b41 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FCC8F6BA80D9476, align 8
@b42 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FCDF9B2C6CCA798, align 8
@b43 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD4FCAF25E738F7, align 8
@b44 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FB3F4AAC1A59B7D, align 8
@g10 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA6397A7E81CDDA, align 8
@g11 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA98B630086749C, align 8
@g12 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF899110CB0218D9, align 8
@g13 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F7A8FE683702134, align 8
@g14 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF6F42754892ACB8, align 8
@g15 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F5700729E7455F4, align 8
@g20 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F9F1D49DDDD1CE1, align 8
@g21 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC91845A9F2BAF6, align 8
@g22 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA881322FCACDD5, align 8
@g23 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF8A64A14807A123, align 8
@g24 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F7A3D05DB18F3C9, align 8
@g25 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF625DFAA9F4AC15, align 8
@g30 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA0888888888889, align 8
@g31 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC8B817BA45857C, align 8
@g32 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD082B47A60FBD6, align 8
@g33 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F93EB1E087F226A, align 8
@g34 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF6FCA2D16E96E9B, align 8
@g35 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F51111111111111, align 8
@g40 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA236F0BBB05BD2, align 8
@g41 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC76706D7111823, align 8
@g42 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD2948B65292B06, align 8
@g43 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FCD628029DF2885, align 8
@g44 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF7BEAD4811B6695, align 8
@g45 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F6826C222282A0A, align 8
@g50 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA0590D7C1D6E61, align 8
@g51 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC8B5F8DB0C2A75, align 8
@g52 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD15726C0DB2D78, align 8
@g53 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD28DEEE140FEC4, align 8
@g54 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC1D61645C8429B, align 8
@g55 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF84A1A5B5C2F323, align 8
@bh10 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA13F196E71AD15, align 8
@bh11 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FAD56A7ABF44657, align 8
@bh12 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF80E27C75E0A843, align 8
@bh13 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F67E1768CBC070F, align 8
@bh14 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF4F9D86EECC165D, align 8
@bh15 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F29AF1321DED70E, align 8
@bh20 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F9048AD66D07B85, align 8
@bh21 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC4D5768063C4EC, align 8
@bh22 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FB895869E138415, align 8
@bh23 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF8814BEF4EC3742, align 8
@bh24 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F6AA8DEA1BC55D7, align 8
@bh25 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF4445662E376735, align 8
@bh30 = protected local_unnamed_addr addrspace(4) externally_initialized global double 3.125000e-02, align 8
@bh31 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FBE6AE283491E9C, align 8
@bh32 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FCFD4FEF1B7EB9E, align 8
@bh33 = protected local_unnamed_addr addrspace(4) externally_initialized global double 1.100000e-01, align 8
@bh34 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF85525C4DDCBA11, align 8
@bh35 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F5B1D581CD1506E, align 8
@bh40 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3F9048AD66D07B85, align 8
@bh41 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC43C841B55DB4E, align 8
@bh42 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FC82AE3238C92BE, align 8
@bh43 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD1F9CAF7922A4E, align 8
@bh44 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FB895869E138415, align 8
@bh45 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0xBF75A6F9678420AC, align 8
@bh50 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FA13F196E71AD15, align 8
@bh51 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FBD49D0226356EC, align 8
@bh52 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FCF8FAC39D7A199, align 8
@bh53 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FCACA285CCE47FC, align 8
@bh54 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD03F1B3D237004, align 8
@bh55 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FAD56A7ABF44657, align 8
@llvm.compiler.used = appending addrspace(1) global [4 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @a1 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @a2 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @a3 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @a4 to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11guessKernelPdS_S_d(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds double, double addrspace(1)* %1, i64 %6
  %8 = load double, double addrspace(1)* %7, align 8, !tbaa !5, !amdgpu.noclobber !9
  %9 = load double, double addrspace(4)* @a1, align 8, !tbaa !5
  %10 = fmul contract double %9, %3
  %11 = getelementptr inbounds double, double addrspace(1)* %2, i64 %6
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !5, !amdgpu.noclobber !9
  %13 = fmul contract double %10, %12
  %14 = fadd contract double %8, %13
  %15 = getelementptr inbounds double, double addrspace(1)* %0, i64 %6
  store double %14, double addrspace(1)* %15, align 8, !tbaa !5
  %16 = load double, double addrspace(1)* %7, align 8, !tbaa !5
  %17 = load double, double addrspace(4)* @a2, align 8, !tbaa !5
  %18 = fmul contract double %17, %3
  %19 = load double, double addrspace(1)* %11, align 8, !tbaa !5
  %20 = fmul contract double %18, %19
  %21 = fadd contract double %16, %20
  %22 = add nuw nsw i32 %5, 2
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds double, double addrspace(1)* %0, i64 %23
  store double %21, double addrspace(1)* %24, align 8, !tbaa !5
  %25 = load double, double addrspace(1)* %7, align 8, !tbaa !5
  %26 = load double, double addrspace(4)* @a3, align 8, !tbaa !5
  %27 = fmul contract double %26, %3
  %28 = load double, double addrspace(1)* %11, align 8, !tbaa !5
  %29 = fmul contract double %27, %28
  %30 = fadd contract double %25, %29
  %31 = add nuw nsw i32 %5, 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  store double %30, double addrspace(1)* %33, align 8, !tbaa !5
  %34 = load double, double addrspace(1)* %7, align 8, !tbaa !5
  %35 = load double, double addrspace(4)* @a4, align 8, !tbaa !5
  %36 = fmul contract double %35, %3
  %37 = load double, double addrspace(1)* %11, align 8, !tbaa !5
  %38 = fmul contract double %36, %37
  %39 = fadd contract double %34, %38
  %40 = add nuw nsw i32 %5, 6
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %0, i64 %41
  store double %39, double addrspace(1)* %42, align 8, !tbaa !5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
