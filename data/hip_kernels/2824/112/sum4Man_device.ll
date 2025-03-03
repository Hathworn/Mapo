; ModuleID = '../data/hip_kernels/2824/112/main.cu'
source_filename = "../data/hip_kernels/2824/112/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7sum4ManPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = mul i32 %5, %10
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %16 = add i32 %14, %15
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !16, !amdgpu.noclobber !5
  %20 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !16, !amdgpu.noclobber !5
  %22 = fdiv contract float %19, 7.000000e+00
  %23 = fdiv contract float %19, 3.000000e+00
  %24 = fmul contract float %21, 1.700000e+01
  %25 = fadd contract float %23, %24
  %26 = fmul contract float %21, 3.000000e+00
  %27 = fadd contract float %26, %25
  %28 = udiv i32 %13, %10
  %29 = mul i32 %28, %10
  %30 = icmp ugt i32 %13, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = mul i32 %32, %10
  %34 = add i32 %33, %16
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !16, !amdgpu.noclobber !5
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %35
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16, !amdgpu.noclobber !5
  %40 = fmul contract float %19, %22
  %41 = fdiv contract float %37, 7.000000e+00
  %42 = fdiv contract float %37, 3.000000e+00
  %43 = fmul contract float %39, 1.700000e+01
  %44 = fadd contract float %42, %43
  %45 = fmul contract float %39, 3.000000e+00
  %46 = fadd contract float %45, %44
  %47 = fmul contract float %19, %40
  %48 = fmul contract float %21, %40
  %49 = fmul contract float %48, 7.000000e+00
  %50 = fadd contract float %47, %49
  %51 = add i32 %34, %33
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16, !amdgpu.noclobber !5
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !16, !amdgpu.noclobber !5
  %57 = fmul contract float %37, %41
  %58 = fdiv contract float %54, 7.000000e+00
  %59 = fdiv contract float %54, 3.000000e+00
  %60 = fmul contract float %56, 1.700000e+01
  %61 = fadd contract float %59, %60
  %62 = fmul contract float %56, 3.000000e+00
  %63 = fadd contract float %62, %61
  %64 = fmul contract float %37, %57
  %65 = fmul contract float %39, %57
  %66 = fmul contract float %65, 7.000000e+00
  %67 = fadd contract float %64, %66
  %68 = add i32 %51, %33
  %69 = icmp slt i32 %68, %3
  br i1 %69, label %70, label %109

70:                                               ; preds = %4
  %71 = sext i32 %68 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16, !amdgpu.noclobber !5
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16, !amdgpu.noclobber !5
  %76 = fmul contract float %54, %58
  %77 = fdiv contract float %73, 7.000000e+00
  %78 = fmul contract float %54, %76
  %79 = fmul contract float %56, %76
  %80 = fmul contract float %79, 7.000000e+00
  %81 = fadd contract float %78, %80
  %82 = fmul contract float %73, %77
  %83 = fsub contract float %27, %50
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16, !amdgpu.noclobber !5
  %86 = fadd contract float %83, %85
  store float %86, float addrspace(1)* %84, align 4, !tbaa !16
  %87 = fsub contract float %46, %67
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = fadd contract float %87, %89
  store float %90, float addrspace(1)* %88, align 4, !tbaa !16
  %91 = fsub contract float %63, %81
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !16
  %94 = fadd contract float %91, %93
  store float %94, float addrspace(1)* %92, align 4, !tbaa !16
  %95 = fmul contract float %73, %82
  %96 = fmul contract float %75, %82
  %97 = fmul contract float %96, 7.000000e+00
  %98 = fadd contract float %95, %97
  %99 = fdiv contract float %73, 3.000000e+00
  %100 = fmul contract float %75, 1.700000e+01
  %101 = fadd contract float %100, %99
  %102 = fmul contract float %75, 3.000000e+00
  %103 = fadd contract float %102, %101
  %104 = fsub contract float %103, %98
  %105 = sext i32 %68 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %2, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = fadd contract float %104, %107
  store float %108, float addrspace(1)* %106, align 4, !tbaa !16
  br label %127

109:                                              ; preds = %4
  %110 = fmul contract float %54, %58
  %111 = fmul contract float %54, %110
  %112 = fmul contract float %56, %110
  %113 = fmul contract float %112, 7.000000e+00
  %114 = fadd contract float %111, %113
  %115 = fsub contract float %27, %50
  %116 = getelementptr inbounds float, float addrspace(1)* %2, i64 %17
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !16, !amdgpu.noclobber !5
  %118 = fadd contract float %115, %117
  store float %118, float addrspace(1)* %116, align 4, !tbaa !16
  %119 = fsub contract float %46, %67
  %120 = getelementptr inbounds float, float addrspace(1)* %2, i64 %35
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16
  %122 = fadd contract float %119, %121
  store float %122, float addrspace(1)* %120, align 4, !tbaa !16
  %123 = fsub contract float %63, %114
  %124 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16
  %126 = fadd contract float %123, %125
  store float %126, float addrspace(1)* %124, align 4, !tbaa !16
  br label %127

127:                                              ; preds = %109, %70
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
