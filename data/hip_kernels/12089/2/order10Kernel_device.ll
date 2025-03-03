; ModuleID = '../data/hip_kernels/12089/2/main.cu'
source_filename = "../data/hip_kernels/12089/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@a1 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FBE12AACA0BCF45, align 8
@a2 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FD6DF62279DAB2A, align 8
@a3 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FE4904EEC312A6B, align 8
@a4 = protected local_unnamed_addr addrspace(4) externally_initialized global double 0x3FEC3DAAA6BE8617, align 8
@b10 = protected addrspace(4) externally_initialized global double 0x3FA83AC02427AF96, align 8
@b11 = protected addrspace(4) externally_initialized global double 0x3FB3F4AAC1A59B7D, align 8
@b12 = protected addrspace(4) externally_initialized global double 0xBF84C0D4C79B4445, align 8
@b13 = protected addrspace(4) externally_initialized global double 0x3F67A5696094ACC4, align 8
@b14 = protected addrspace(4) externally_initialized global double 0xBF42385DDF707025, align 8
@b20 = protected addrspace(4) externally_initialized global double 0x3F964D4109BBBC9E, align 8
@b21 = protected addrspace(4) externally_initialized global double 0x3FCCA18876315713, align 8
@b22 = protected addrspace(4) externally_initialized global double 0x3FBF3E88718D97B6, align 8
@b23 = protected addrspace(4) externally_initialized global double 0xBF88C34E57793767, align 8
@b24 = protected addrspace(4) externally_initialized global double 0x3F60211920D3D294, align 8
@b30 = protected addrspace(4) externally_initialized global double 0x3FA6FB819D4443D3, align 8
@b31 = protected addrspace(4) externally_initialized global double 0x3FC472503BF08020, align 8
@b32 = protected addrspace(4) externally_initialized global double 0x3FD4A9A2EFC6D9DA, align 8
@b33 = protected addrspace(4) externally_initialized global double 0x3FBF3E88718D97B6, align 8
@b34 = protected addrspace(4) externally_initialized global double 0xBF7C4FE15A2CDF36, align 8
@b40 = protected addrspace(4) externally_initialized global double 0x3F93CEC3FBF4E518, align 8
@b41 = protected addrspace(4) externally_initialized global double 0x3FCC8F6BA80D9476, align 8
@b42 = protected addrspace(4) externally_initialized global double 0x3FCDF9B2C6CCA798, align 8
@b43 = protected addrspace(4) externally_initialized global double 0x3FD4FCAF25E738F7, align 8
@b44 = protected addrspace(4) externally_initialized global double 0x3FB3F4AAC1A59B7D, align 8
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
@llvm.compiler.used = appending addrspace(1) global [20 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b10 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b11 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b12 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b13 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b14 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b20 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b21 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b22 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b23 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b24 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b30 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b31 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b32 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b33 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b34 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b40 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b41 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b42 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b43 to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (double addrspace(4)* @b44 to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z13order10KernelPdS_S_dS_(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double %3, double addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds double, double addrspace(1)* %1, i64 %7
  %9 = load double, double addrspace(1)* %8, align 8, !tbaa !5, !amdgpu.noclobber !9
  %10 = load double, double addrspace(4)* @b10, align 8, !tbaa !5
  %11 = getelementptr inbounds double, double addrspace(1)* %2, i64 %7
  %12 = load double, double addrspace(1)* %11, align 8, !tbaa !5, !amdgpu.noclobber !9
  %13 = fmul contract double %10, %12
  %14 = load double, double addrspace(4)* @b11, align 8, !tbaa !5
  %15 = getelementptr inbounds double, double addrspace(1)* %4, i64 %7
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !5, !amdgpu.noclobber !9
  %17 = fmul contract double %14, %16
  %18 = fadd contract double %13, %17
  %19 = load double, double addrspace(4)* @b12, align 8, !tbaa !5
  %20 = add nuw nsw i32 %6, 2
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds double, double addrspace(1)* %4, i64 %21
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !5, !amdgpu.noclobber !9
  %24 = fmul contract double %19, %23
  %25 = fadd contract double %18, %24
  %26 = load double, double addrspace(4)* @b13, align 8, !tbaa !5
  %27 = add nuw nsw i32 %6, 4
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %4, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !5, !amdgpu.noclobber !9
  %31 = fmul contract double %26, %30
  %32 = fadd contract double %25, %31
  %33 = load double, double addrspace(4)* @b14, align 8, !tbaa !5
  %34 = add nuw nsw i32 %6, 6
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %4, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !5, !amdgpu.noclobber !9
  %38 = fmul contract double %33, %37
  %39 = fadd contract double %32, %38
  %40 = fmul contract double %39, %3
  %41 = fadd contract double %9, %40
  %42 = getelementptr inbounds double, double addrspace(1)* %0, i64 %7
  store double %41, double addrspace(1)* %42, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = load double, double addrspace(1)* %8, align 8, !tbaa !5
  %44 = load double, double addrspace(4)* @b20, align 8, !tbaa !5
  %45 = load double, double addrspace(1)* %11, align 8, !tbaa !5
  %46 = fmul contract double %44, %45
  %47 = load double, double addrspace(4)* @b21, align 8, !tbaa !5
  %48 = load double, double addrspace(1)* %15, align 8, !tbaa !5
  %49 = fmul contract double %47, %48
  %50 = fadd contract double %46, %49
  %51 = load double, double addrspace(4)* @b22, align 8, !tbaa !5
  %52 = load double, double addrspace(1)* %22, align 8, !tbaa !5
  %53 = fmul contract double %51, %52
  %54 = fadd contract double %50, %53
  %55 = load double, double addrspace(4)* @b23, align 8, !tbaa !5
  %56 = load double, double addrspace(1)* %29, align 8, !tbaa !5
  %57 = fmul contract double %55, %56
  %58 = fadd contract double %54, %57
  %59 = load double, double addrspace(4)* @b24, align 8, !tbaa !5
  %60 = load double, double addrspace(1)* %36, align 8, !tbaa !5
  %61 = fmul contract double %59, %60
  %62 = fadd contract double %58, %61
  %63 = fmul contract double %62, %3
  %64 = fadd contract double %43, %63
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %21
  store double %64, double addrspace(1)* %65, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %66 = load double, double addrspace(1)* %8, align 8, !tbaa !5
  %67 = load double, double addrspace(4)* @b30, align 8, !tbaa !5
  %68 = load double, double addrspace(1)* %11, align 8, !tbaa !5
  %69 = fmul contract double %67, %68
  %70 = load double, double addrspace(4)* @b31, align 8, !tbaa !5
  %71 = load double, double addrspace(1)* %15, align 8, !tbaa !5
  %72 = fmul contract double %70, %71
  %73 = fadd contract double %69, %72
  %74 = load double, double addrspace(4)* @b32, align 8, !tbaa !5
  %75 = load double, double addrspace(1)* %22, align 8, !tbaa !5
  %76 = fmul contract double %74, %75
  %77 = fadd contract double %73, %76
  %78 = load double, double addrspace(4)* @b33, align 8, !tbaa !5
  %79 = load double, double addrspace(1)* %29, align 8, !tbaa !5
  %80 = fmul contract double %78, %79
  %81 = fadd contract double %77, %80
  %82 = load double, double addrspace(4)* @b34, align 8, !tbaa !5
  %83 = load double, double addrspace(1)* %36, align 8, !tbaa !5
  %84 = fmul contract double %82, %83
  %85 = fadd contract double %81, %84
  %86 = fmul contract double %85, %3
  %87 = fadd contract double %66, %86
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  store double %87, double addrspace(1)* %88, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = load double, double addrspace(1)* %8, align 8, !tbaa !5
  %90 = load double, double addrspace(4)* @b40, align 8, !tbaa !5
  %91 = load double, double addrspace(1)* %11, align 8, !tbaa !5
  %92 = fmul contract double %90, %91
  %93 = load double, double addrspace(4)* @b41, align 8, !tbaa !5
  %94 = load double, double addrspace(1)* %15, align 8, !tbaa !5
  %95 = fmul contract double %93, %94
  %96 = fadd contract double %92, %95
  %97 = load double, double addrspace(4)* @b42, align 8, !tbaa !5
  %98 = load double, double addrspace(1)* %22, align 8, !tbaa !5
  %99 = fmul contract double %97, %98
  %100 = fadd contract double %96, %99
  %101 = load double, double addrspace(4)* @b43, align 8, !tbaa !5
  %102 = load double, double addrspace(1)* %29, align 8, !tbaa !5
  %103 = fmul contract double %101, %102
  %104 = fadd contract double %100, %103
  %105 = load double, double addrspace(4)* @b44, align 8, !tbaa !5
  %106 = load double, double addrspace(1)* %36, align 8, !tbaa !5
  %107 = fmul contract double %105, %106
  %108 = fadd contract double %104, %107
  %109 = fmul contract double %108, %3
  %110 = fadd contract double %89, %109
  %111 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  store double %110, double addrspace(1)* %111, align 8, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
