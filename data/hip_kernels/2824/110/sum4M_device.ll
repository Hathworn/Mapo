; ModuleID = '../data/hip_kernels/2824/110/main.cu'
source_filename = "../data/hip_kernels/2824/110/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5sum4MPfS_S_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3) local_unnamed_addr #0 {
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
  br i1 %17, label %18, label %48

18:                                               ; preds = %4
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !16
  %22 = fpext float %21 to double
  %23 = fdiv contract double %22, 7.000000e+00
  %24 = fmul contract double %23, %22
  %25 = fptrunc double %24 to float
  %26 = fdiv contract float %21, 3.000000e+00
  %27 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %28 = load float, float addrspace(1)* %27, align 4, !tbaa !16
  %29 = fmul contract float %28, 1.700000e+01
  %30 = fadd contract float %26, %29
  %31 = fmul contract float %28, 3.000000e+00
  %32 = fadd contract float %31, %30
  %33 = fmul contract float %21, %25
  %34 = fsub contract float %32, %33
  %35 = fmul contract float %28, %25
  %36 = fmul contract float %35, 7.000000e+00
  %37 = fadd contract float %34, %36
  %38 = getelementptr inbounds float, float addrspace(1)* %2, i64 %19
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %40 = fadd contract float %39, %37
  store float %40, float addrspace(1)* %38, align 4, !tbaa !16
  %41 = udiv i32 %13, %10
  %42 = mul i32 %41, %10
  %43 = icmp ugt i32 %13, %42
  %44 = zext i1 %43 to i32
  %45 = add i32 %41, %44
  %46 = mul i32 %45, %10
  %47 = add i32 %46, %16
  br label %48

48:                                               ; preds = %4, %18
  %49 = phi i32 [ %47, %18 ], [ %16, %4 ]
  %50 = icmp slt i32 %49, %3
  br i1 %50, label %51, label %81

51:                                               ; preds = %48
  %52 = sext i32 %49 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !16
  %55 = fpext float %54 to double
  %56 = fdiv contract double %55, 7.000000e+00
  %57 = fmul contract double %56, %55
  %58 = fptrunc double %57 to float
  %59 = fdiv contract float %54, 3.000000e+00
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %52
  %61 = load float, float addrspace(1)* %60, align 4, !tbaa !16
  %62 = fmul contract float %61, 1.700000e+01
  %63 = fadd contract float %59, %62
  %64 = fmul contract float %61, 3.000000e+00
  %65 = fadd contract float %64, %63
  %66 = fmul contract float %54, %58
  %67 = fsub contract float %65, %66
  %68 = fmul contract float %61, %58
  %69 = fmul contract float %68, 7.000000e+00
  %70 = fadd contract float %67, %69
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %52
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16
  %73 = fadd contract float %72, %70
  store float %73, float addrspace(1)* %71, align 4, !tbaa !16
  %74 = udiv i32 %13, %10
  %75 = mul i32 %74, %10
  %76 = icmp ugt i32 %13, %75
  %77 = zext i1 %76 to i32
  %78 = add i32 %74, %77
  %79 = mul i32 %78, %10
  %80 = add i32 %79, %49
  br label %81

81:                                               ; preds = %51, %48
  %82 = phi i32 [ %80, %51 ], [ %49, %48 ]
  %83 = icmp slt i32 %82, %3
  br i1 %83, label %84, label %114

84:                                               ; preds = %81
  %85 = sext i32 %82 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %0, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !16
  %88 = fpext float %87 to double
  %89 = fdiv contract double %88, 7.000000e+00
  %90 = fmul contract double %89, %88
  %91 = fptrunc double %90 to float
  %92 = fdiv contract float %87, 3.000000e+00
  %93 = getelementptr inbounds float, float addrspace(1)* %1, i64 %85
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !16
  %95 = fmul contract float %94, 1.700000e+01
  %96 = fadd contract float %92, %95
  %97 = fmul contract float %94, 3.000000e+00
  %98 = fadd contract float %97, %96
  %99 = fmul contract float %87, %91
  %100 = fsub contract float %98, %99
  %101 = fmul contract float %94, %91
  %102 = fmul contract float %101, 7.000000e+00
  %103 = fadd contract float %100, %102
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %85
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !16
  %106 = fadd contract float %105, %103
  store float %106, float addrspace(1)* %104, align 4, !tbaa !16
  %107 = udiv i32 %13, %10
  %108 = mul i32 %107, %10
  %109 = icmp ugt i32 %13, %108
  %110 = zext i1 %109 to i32
  %111 = add i32 %107, %110
  %112 = mul i32 %111, %10
  %113 = add i32 %112, %82
  br label %114

114:                                              ; preds = %84, %81
  %115 = phi i32 [ %113, %84 ], [ %82, %81 ]
  %116 = icmp slt i32 %115, %3
  br i1 %116, label %117, label %140

117:                                              ; preds = %114
  %118 = sext i32 %115 to i64
  %119 = getelementptr inbounds float, float addrspace(1)* %0, i64 %118
  %120 = load float, float addrspace(1)* %119, align 4, !tbaa !16
  %121 = fpext float %120 to double
  %122 = fdiv contract double %121, 7.000000e+00
  %123 = fmul contract double %122, %121
  %124 = fptrunc double %123 to float
  %125 = fdiv contract float %120, 3.000000e+00
  %126 = getelementptr inbounds float, float addrspace(1)* %1, i64 %118
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = fmul contract float %127, 1.700000e+01
  %129 = fadd contract float %125, %128
  %130 = fmul contract float %127, 3.000000e+00
  %131 = fadd contract float %130, %129
  %132 = fmul contract float %120, %124
  %133 = fsub contract float %131, %132
  %134 = fmul contract float %127, %124
  %135 = fmul contract float %134, 7.000000e+00
  %136 = fadd contract float %133, %135
  %137 = getelementptr inbounds float, float addrspace(1)* %2, i64 %118
  %138 = load float, float addrspace(1)* %137, align 4, !tbaa !16
  %139 = fadd contract float %138, %136
  store float %139, float addrspace(1)* %137, align 4, !tbaa !16
  br label %140

140:                                              ; preds = %117, %114
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
