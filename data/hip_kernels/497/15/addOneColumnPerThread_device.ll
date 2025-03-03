; ModuleID = '../data/hip_kernels/497/15/main.cu'
source_filename = "../data/hip_kernels/497/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z21addOneColumnPerThreadPdS_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  %15 = icmp sgt i32 %3, 0
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %125

17:                                               ; preds = %4
  %18 = and i32 %3, 7
  %19 = icmp ult i32 %3, 8
  br i1 %19, label %107, label %20

20:                                               ; preds = %17
  %21 = and i32 %3, -8
  br label %22

22:                                               ; preds = %22, %20
  %23 = phi i32 [ 0, %20 ], [ %104, %22 ]
  %24 = phi i32 [ 0, %20 ], [ %105, %22 ]
  %25 = mul nsw i32 %23, %3
  %26 = add nsw i32 %25, %13
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, double addrspace(1)* %0, i64 %27
  %29 = load double, double addrspace(1)* %28, align 8, !tbaa !7
  %30 = getelementptr inbounds double, double addrspace(1)* %1, i64 %27
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7
  %32 = fadd contract double %29, %31
  %33 = getelementptr inbounds double, double addrspace(1)* %2, i64 %27
  store double %32, double addrspace(1)* %33, align 8, !tbaa !7
  %34 = or i32 %23, 1
  %35 = mul nsw i32 %34, %3
  %36 = add nsw i32 %35, %13
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %0, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7
  %40 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = fadd contract double %39, %41
  %43 = getelementptr inbounds double, double addrspace(1)* %2, i64 %37
  store double %42, double addrspace(1)* %43, align 8, !tbaa !7
  %44 = or i32 %23, 2
  %45 = mul nsw i32 %44, %3
  %46 = add nsw i32 %45, %13
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = getelementptr inbounds double, double addrspace(1)* %1, i64 %47
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %52 = fadd contract double %49, %51
  %53 = getelementptr inbounds double, double addrspace(1)* %2, i64 %47
  store double %52, double addrspace(1)* %53, align 8, !tbaa !7
  %54 = or i32 %23, 3
  %55 = mul nsw i32 %54, %3
  %56 = add nsw i32 %55, %13
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7
  %62 = fadd contract double %59, %61
  %63 = getelementptr inbounds double, double addrspace(1)* %2, i64 %57
  store double %62, double addrspace(1)* %63, align 8, !tbaa !7
  %64 = or i32 %23, 4
  %65 = mul nsw i32 %64, %3
  %66 = add nsw i32 %65, %13
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  %70 = getelementptr inbounds double, double addrspace(1)* %1, i64 %67
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %72 = fadd contract double %69, %71
  %73 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  store double %72, double addrspace(1)* %73, align 8, !tbaa !7
  %74 = or i32 %23, 5
  %75 = mul nsw i32 %74, %3
  %76 = add nsw i32 %75, %13
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double addrspace(1)* %0, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7
  %80 = getelementptr inbounds double, double addrspace(1)* %1, i64 %77
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  %82 = fadd contract double %79, %81
  %83 = getelementptr inbounds double, double addrspace(1)* %2, i64 %77
  store double %82, double addrspace(1)* %83, align 8, !tbaa !7
  %84 = or i32 %23, 6
  %85 = mul nsw i32 %84, %3
  %86 = add nsw i32 %85, %13
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7
  %90 = getelementptr inbounds double, double addrspace(1)* %1, i64 %87
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !7
  %92 = fadd contract double %89, %91
  %93 = getelementptr inbounds double, double addrspace(1)* %2, i64 %87
  store double %92, double addrspace(1)* %93, align 8, !tbaa !7
  %94 = or i32 %23, 7
  %95 = mul nsw i32 %94, %3
  %96 = add nsw i32 %95, %13
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %0, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7
  %100 = getelementptr inbounds double, double addrspace(1)* %1, i64 %97
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7
  %102 = fadd contract double %99, %101
  %103 = getelementptr inbounds double, double addrspace(1)* %2, i64 %97
  store double %102, double addrspace(1)* %103, align 8, !tbaa !7
  %104 = add nuw nsw i32 %23, 8
  %105 = add i32 %24, 8
  %106 = icmp eq i32 %105, %21
  br i1 %106, label %107, label %22, !llvm.loop !11

107:                                              ; preds = %22, %17
  %108 = phi i32 [ 0, %17 ], [ %104, %22 ]
  %109 = icmp eq i32 %18, 0
  br i1 %109, label %125, label %110

110:                                              ; preds = %107, %110
  %111 = phi i32 [ %122, %110 ], [ %108, %107 ]
  %112 = phi i32 [ %123, %110 ], [ 0, %107 ]
  %113 = mul nsw i32 %111, %3
  %114 = add nsw i32 %113, %13
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double addrspace(1)* %0, i64 %115
  %117 = load double, double addrspace(1)* %116, align 8, !tbaa !7
  %118 = getelementptr inbounds double, double addrspace(1)* %1, i64 %115
  %119 = load double, double addrspace(1)* %118, align 8, !tbaa !7
  %120 = fadd contract double %117, %119
  %121 = getelementptr inbounds double, double addrspace(1)* %2, i64 %115
  store double %120, double addrspace(1)* %121, align 8, !tbaa !7
  %122 = add nuw nsw i32 %111, 1
  %123 = add i32 %112, 1
  %124 = icmp eq i32 %123, %18
  br i1 %124, label %125, label %110, !llvm.loop !13

125:                                              ; preds = %107, %110, %4
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
