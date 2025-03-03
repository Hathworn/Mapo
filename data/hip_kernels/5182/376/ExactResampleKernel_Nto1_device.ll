; ModuleID = '../data/hip_kernels/5182/376/main.cu'
source_filename = "../data/hip_kernels/5182/376/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24ExactResampleKernel_Nto1PfS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !6
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = udiv i32 %14, %11
  %18 = mul i32 %17, %11
  %19 = icmp ugt i32 %14, %18
  %20 = zext i1 %19 to i32
  %21 = add i32 %17, %20
  %22 = mul i32 %21, %16
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %15
  %25 = mul i32 %24, %11
  %26 = add i32 %25, %23
  %27 = mul nsw i32 %5, %4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %152

29:                                               ; preds = %6
  %30 = freeze i32 %26
  %31 = freeze i32 %4
  %32 = sdiv i32 %30, %31
  %33 = mul i32 %32, %31
  %34 = sub i32 %30, %33
  %35 = sdiv i32 %2, %4
  %36 = sdiv i32 %3, %5
  %37 = icmp sgt i32 %35, 0
  br i1 %37, label %38, label %51

38:                                               ; preds = %29
  %39 = icmp sgt i32 %36, 0
  %40 = mul nsw i32 %35, %34
  %41 = mul nsw i32 %36, %32
  %42 = and i32 %36, 7
  %43 = icmp ult i32 %36, 8
  %44 = and i32 %36, -8
  %45 = icmp eq i32 %42, 0
  br label %46

46:                                               ; preds = %38, %78
  %47 = phi float [ 0.000000e+00, %38 ], [ %79, %78 ]
  %48 = phi i32 [ 0, %38 ], [ %80, %78 ]
  br i1 %39, label %49, label %78

49:                                               ; preds = %46
  %50 = add nsw i32 %48, %40
  br i1 %43, label %60, label %82

51:                                               ; preds = %78, %29
  %52 = phi float [ 0.000000e+00, %29 ], [ %79, %78 ]
  %53 = mul nsw i32 %36, %35
  %54 = sitofp i32 %53 to float
  %55 = fdiv contract float %52, %54
  %56 = mul nsw i32 %32, %4
  %57 = add nsw i32 %56, %34
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %1, i64 %58
  store float %55, float addrspace(1)* %59, align 4, !tbaa !16
  br label %152

60:                                               ; preds = %82, %49
  %61 = phi float [ undef, %49 ], [ %148, %82 ]
  %62 = phi float [ %47, %49 ], [ %148, %82 ]
  %63 = phi i32 [ 0, %49 ], [ %149, %82 ]
  br i1 %45, label %78, label %64

64:                                               ; preds = %60, %64
  %65 = phi float [ %74, %64 ], [ %62, %60 ]
  %66 = phi i32 [ %75, %64 ], [ %63, %60 ]
  %67 = phi i32 [ %76, %64 ], [ 0, %60 ]
  %68 = add nsw i32 %66, %41
  %69 = mul nsw i32 %68, %2
  %70 = add nsw i32 %50, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %0, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !16, !amdgpu.noclobber !5
  %74 = fadd contract float %65, %73
  %75 = add nuw nsw i32 %66, 1
  %76 = add i32 %67, 1
  %77 = icmp eq i32 %76, %42
  br i1 %77, label %78, label %64, !llvm.loop !20

78:                                               ; preds = %60, %64, %46
  %79 = phi float [ %47, %46 ], [ %61, %60 ], [ %74, %64 ]
  %80 = add nuw nsw i32 %48, 1
  %81 = icmp eq i32 %80, %35
  br i1 %81, label %51, label %46, !llvm.loop !22

82:                                               ; preds = %49, %82
  %83 = phi float [ %148, %82 ], [ %47, %49 ]
  %84 = phi i32 [ %149, %82 ], [ 0, %49 ]
  %85 = phi i32 [ %150, %82 ], [ 0, %49 ]
  %86 = add nsw i32 %84, %41
  %87 = mul nsw i32 %86, %2
  %88 = add nsw i32 %50, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %89
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16, !amdgpu.noclobber !5
  %92 = fadd contract float %83, %91
  %93 = or i32 %84, 1
  %94 = add nsw i32 %93, %41
  %95 = mul nsw i32 %94, %2
  %96 = add nsw i32 %50, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !16, !amdgpu.noclobber !5
  %100 = fadd contract float %92, %99
  %101 = or i32 %84, 2
  %102 = add nsw i32 %101, %41
  %103 = mul nsw i32 %102, %2
  %104 = add nsw i32 %50, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16, !amdgpu.noclobber !5
  %108 = fadd contract float %100, %107
  %109 = or i32 %84, 3
  %110 = add nsw i32 %109, %41
  %111 = mul nsw i32 %110, %2
  %112 = add nsw i32 %50, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %0, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !16, !amdgpu.noclobber !5
  %116 = fadd contract float %108, %115
  %117 = or i32 %84, 4
  %118 = add nsw i32 %117, %41
  %119 = mul nsw i32 %118, %2
  %120 = add nsw i32 %50, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !16, !amdgpu.noclobber !5
  %124 = fadd contract float %116, %123
  %125 = or i32 %84, 5
  %126 = add nsw i32 %125, %41
  %127 = mul nsw i32 %126, %2
  %128 = add nsw i32 %50, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %0, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !16, !amdgpu.noclobber !5
  %132 = fadd contract float %124, %131
  %133 = or i32 %84, 6
  %134 = add nsw i32 %133, %41
  %135 = mul nsw i32 %134, %2
  %136 = add nsw i32 %50, %135
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds float, float addrspace(1)* %0, i64 %137
  %139 = load float, float addrspace(1)* %138, align 4, !tbaa !16, !amdgpu.noclobber !5
  %140 = fadd contract float %132, %139
  %141 = or i32 %84, 7
  %142 = add nsw i32 %141, %41
  %143 = mul nsw i32 %142, %2
  %144 = add nsw i32 %50, %143
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %0, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !16, !amdgpu.noclobber !5
  %148 = fadd contract float %140, %147
  %149 = add nuw nsw i32 %84, 8
  %150 = add i32 %85, 8
  %151 = icmp eq i32 %150, %44
  br i1 %151, label %60, label %82, !llvm.loop !24

152:                                              ; preds = %51, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}
