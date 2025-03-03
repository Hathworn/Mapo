; ModuleID = '../data/hip_kernels/2824/111/main.cu'
source_filename = "../data/hip_kernels/2824/111/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5sum4KPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
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
  %17 = icmp slt i32 %16, %3
  br i1 %17, label %18, label %45

18:                                               ; preds = %4
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !16
  %22 = fmul contract float %21, %21
  %23 = fmul contract float %21, 3.000000e+00
  %24 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %25 = load float, float addrspace(1)* %24, align 4, !tbaa !16
  %26 = fmul contract float %25, 1.700000e+01
  %27 = fadd contract float %23, %26
  %28 = fmul contract float %25, 3.000000e+00
  %29 = fadd contract float %28, %27
  %30 = fmul contract float %21, %22
  %31 = fsub contract float %29, %30
  %32 = fmul contract float %22, %25
  %33 = fmul contract float %32, 7.000000e+00
  %34 = fadd contract float %33, %31
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %19
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !16
  %37 = fadd contract float %36, %34
  store float %37, float addrspace(1)* %35, align 4, !tbaa !16
  %38 = udiv i32 %13, %10
  %39 = mul i32 %38, %10
  %40 = icmp ugt i32 %13, %39
  %41 = zext i1 %40 to i32
  %42 = add i32 %38, %41
  %43 = mul i32 %42, %10
  %44 = add i32 %43, %16
  br label %45

45:                                               ; preds = %4, %18
  %46 = phi i32 [ %44, %18 ], [ %16, %4 ]
  %47 = icmp slt i32 %46, %3
  br i1 %47, label %48, label %75

48:                                               ; preds = %45
  %49 = sext i32 %46 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !16
  %52 = fmul contract float %51, %51
  %53 = fmul contract float %51, 3.000000e+00
  %54 = getelementptr inbounds float, float addrspace(1)* %1, i64 %49
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !16
  %56 = fmul contract float %55, 1.700000e+01
  %57 = fadd contract float %53, %56
  %58 = fmul contract float %55, 3.000000e+00
  %59 = fadd contract float %58, %57
  %60 = fmul contract float %51, %52
  %61 = fsub contract float %59, %60
  %62 = fmul contract float %52, %55
  %63 = fmul contract float %62, 7.000000e+00
  %64 = fadd contract float %63, %61
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = fadd contract float %66, %64
  store float %67, float addrspace(1)* %65, align 4, !tbaa !16
  %68 = udiv i32 %13, %10
  %69 = mul i32 %68, %10
  %70 = icmp ugt i32 %13, %69
  %71 = zext i1 %70 to i32
  %72 = add i32 %68, %71
  %73 = mul i32 %72, %10
  %74 = add i32 %73, %46
  br label %75

75:                                               ; preds = %48, %45
  %76 = phi i32 [ %74, %48 ], [ %46, %45 ]
  %77 = icmp slt i32 %76, %3
  br i1 %77, label %78, label %105

78:                                               ; preds = %75
  %79 = sext i32 %76 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %0, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !16
  %82 = fmul contract float %81, %81
  %83 = fmul contract float %81, 3.000000e+00
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %79
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !16
  %86 = fmul contract float %85, 1.700000e+01
  %87 = fadd contract float %83, %86
  %88 = fmul contract float %85, 3.000000e+00
  %89 = fadd contract float %88, %87
  %90 = fmul contract float %81, %82
  %91 = fsub contract float %89, %90
  %92 = fmul contract float %82, %85
  %93 = fmul contract float %92, 7.000000e+00
  %94 = fadd contract float %93, %91
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16
  %97 = fadd contract float %96, %94
  store float %97, float addrspace(1)* %95, align 4, !tbaa !16
  %98 = udiv i32 %13, %10
  %99 = mul i32 %98, %10
  %100 = icmp ugt i32 %13, %99
  %101 = zext i1 %100 to i32
  %102 = add i32 %98, %101
  %103 = mul i32 %102, %10
  %104 = add i32 %103, %76
  br label %105

105:                                              ; preds = %78, %75
  %106 = phi i32 [ %104, %78 ], [ %76, %75 ]
  %107 = icmp slt i32 %106, %3
  br i1 %107, label %108, label %128

108:                                              ; preds = %105
  %109 = sext i32 %106 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %0, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !16
  %112 = fmul contract float %111, %111
  %113 = fmul contract float %111, 3.000000e+00
  %114 = getelementptr inbounds float, float addrspace(1)* %1, i64 %109
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16
  %116 = fmul contract float %115, 1.700000e+01
  %117 = fadd contract float %113, %116
  %118 = fmul contract float %115, 3.000000e+00
  %119 = fadd contract float %118, %117
  %120 = fmul contract float %111, %112
  %121 = fsub contract float %119, %120
  %122 = fmul contract float %112, %115
  %123 = fmul contract float %122, 7.000000e+00
  %124 = fadd contract float %123, %121
  %125 = getelementptr inbounds float, float addrspace(1)* %2, i64 %109
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16
  %127 = fadd contract float %126, %124
  store float %127, float addrspace(1)* %125, align 4, !tbaa !16
  br label %128

128:                                              ; preds = %108, %105
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
