; ModuleID = '../data/hip_kernels/15412/110/main.cu'
source_filename = "../data/hip_kernels/15412/110/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z30reduce_and_expand_array_kernelPKfPfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %2
  br i1 %14, label %15, label %169

15:                                               ; preds = %4
  %16 = icmp sgt i32 %3, 0
  br i1 %16, label %17, label %40

17:                                               ; preds = %15
  %18 = and i32 %3, 7
  %19 = icmp ult i32 %3, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i32 %3, -8
  br label %49

22:                                               ; preds = %49, %17
  %23 = phi float [ undef, %17 ], [ %107, %49 ]
  %24 = phi i32 [ 0, %17 ], [ %108, %49 ]
  %25 = phi float [ 0.000000e+00, %17 ], [ %107, %49 ]
  %26 = icmp eq i32 %18, 0
  br i1 %26, label %40, label %27

27:                                               ; preds = %22, %27
  %28 = phi i32 [ %37, %27 ], [ %24, %22 ]
  %29 = phi float [ %36, %27 ], [ %25, %22 ]
  %30 = phi i32 [ %38, %27 ], [ 0, %22 ]
  %31 = mul nsw i32 %28, %2
  %32 = add nsw i32 %31, %13
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = fadd contract float %29, %35
  %37 = add nuw nsw i32 %28, 1
  %38 = add i32 %30, 1
  %39 = icmp eq i32 %38, %18
  br i1 %39, label %40, label %27, !llvm.loop !11

40:                                               ; preds = %22, %27, %15
  %41 = phi float [ 0.000000e+00, %15 ], [ %23, %22 ], [ %36, %27 ]
  br i1 %16, label %42, label %169

42:                                               ; preds = %40
  %43 = sitofp i32 %3 to float
  %44 = fdiv contract float %41, %43
  %45 = and i32 %3, 7
  %46 = icmp ult i32 %3, 8
  br i1 %46, label %156, label %47

47:                                               ; preds = %42
  %48 = and i32 %3, -8
  br label %111

49:                                               ; preds = %49, %20
  %50 = phi i32 [ 0, %20 ], [ %108, %49 ]
  %51 = phi float [ 0.000000e+00, %20 ], [ %107, %49 ]
  %52 = phi i32 [ 0, %20 ], [ %109, %49 ]
  %53 = mul nsw i32 %50, %2
  %54 = add nsw i32 %53, %13
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float addrspace(1)* %0, i64 %55
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = fadd contract float %51, %57
  %59 = or i32 %50, 1
  %60 = mul nsw i32 %59, %2
  %61 = add nsw i32 %60, %13
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = fadd contract float %58, %64
  %66 = or i32 %50, 2
  %67 = mul nsw i32 %66, %2
  %68 = add nsw i32 %67, %13
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !7, !amdgpu.noclobber !5
  %72 = fadd contract float %65, %71
  %73 = or i32 %50, 3
  %74 = mul nsw i32 %73, %2
  %75 = add nsw i32 %74, %13
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %0, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7, !amdgpu.noclobber !5
  %79 = fadd contract float %72, %78
  %80 = or i32 %50, 4
  %81 = mul nsw i32 %80, %2
  %82 = add nsw i32 %81, %13
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %0, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !5
  %86 = fadd contract float %79, %85
  %87 = or i32 %50, 5
  %88 = mul nsw i32 %87, %2
  %89 = add nsw i32 %88, %13
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %0, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fadd contract float %86, %92
  %94 = or i32 %50, 6
  %95 = mul nsw i32 %94, %2
  %96 = add nsw i32 %95, %13
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %0, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !7, !amdgpu.noclobber !5
  %100 = fadd contract float %93, %99
  %101 = or i32 %50, 7
  %102 = mul nsw i32 %101, %2
  %103 = add nsw i32 %102, %13
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %0, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = fadd contract float %100, %106
  %108 = add nuw nsw i32 %50, 8
  %109 = add i32 %52, 8
  %110 = icmp eq i32 %109, %21
  br i1 %110, label %22, label %49, !llvm.loop !13

111:                                              ; preds = %111, %47
  %112 = phi i32 [ 0, %47 ], [ %153, %111 ]
  %113 = phi i32 [ 0, %47 ], [ %154, %111 ]
  %114 = mul nsw i32 %112, %2
  %115 = add nsw i32 %114, %13
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %1, i64 %116
  store float %44, float addrspace(1)* %117, align 4, !tbaa !7
  %118 = or i32 %112, 1
  %119 = mul nsw i32 %118, %2
  %120 = add nsw i32 %119, %13
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %1, i64 %121
  store float %44, float addrspace(1)* %122, align 4, !tbaa !7
  %123 = or i32 %112, 2
  %124 = mul nsw i32 %123, %2
  %125 = add nsw i32 %124, %13
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds float, float addrspace(1)* %1, i64 %126
  store float %44, float addrspace(1)* %127, align 4, !tbaa !7
  %128 = or i32 %112, 3
  %129 = mul nsw i32 %128, %2
  %130 = add nsw i32 %129, %13
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds float, float addrspace(1)* %1, i64 %131
  store float %44, float addrspace(1)* %132, align 4, !tbaa !7
  %133 = or i32 %112, 4
  %134 = mul nsw i32 %133, %2
  %135 = add nsw i32 %134, %13
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  store float %44, float addrspace(1)* %137, align 4, !tbaa !7
  %138 = or i32 %112, 5
  %139 = mul nsw i32 %138, %2
  %140 = add nsw i32 %139, %13
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  store float %44, float addrspace(1)* %142, align 4, !tbaa !7
  %143 = or i32 %112, 6
  %144 = mul nsw i32 %143, %2
  %145 = add nsw i32 %144, %13
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds float, float addrspace(1)* %1, i64 %146
  store float %44, float addrspace(1)* %147, align 4, !tbaa !7
  %148 = or i32 %112, 7
  %149 = mul nsw i32 %148, %2
  %150 = add nsw i32 %149, %13
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %1, i64 %151
  store float %44, float addrspace(1)* %152, align 4, !tbaa !7
  %153 = add nuw nsw i32 %112, 8
  %154 = add i32 %113, 8
  %155 = icmp eq i32 %154, %48
  br i1 %155, label %156, label %111, !llvm.loop !15

156:                                              ; preds = %111, %42
  %157 = phi i32 [ 0, %42 ], [ %153, %111 ]
  %158 = icmp eq i32 %45, 0
  br i1 %158, label %169, label %159

159:                                              ; preds = %156, %159
  %160 = phi i32 [ %166, %159 ], [ %157, %156 ]
  %161 = phi i32 [ %167, %159 ], [ 0, %156 ]
  %162 = mul nsw i32 %160, %2
  %163 = add nsw i32 %162, %13
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %1, i64 %164
  store float %44, float addrspace(1)* %165, align 4, !tbaa !7
  %166 = add nuw nsw i32 %160, 1
  %167 = add i32 %161, 1
  %168 = icmp eq i32 %167, %45
  br i1 %168, label %169, label %159, !llvm.loop !16

169:                                              ; preds = %156, %159, %40, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
!16 = distinct !{!16, !12}
