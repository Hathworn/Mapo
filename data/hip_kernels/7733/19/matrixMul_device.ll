; ModuleID = '../data/hip_kernels/7733/19/main.cu'
source_filename = "../data/hip_kernels/7733/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9matrixMulPdS_S_iii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = icmp slt i32 %15, %4
  %25 = icmp slt i32 %23, %3
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %115

27:                                               ; preds = %6
  %28 = mul nsw i32 %15, %3
  %29 = add nsw i32 %28, %23
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %2, i64 %30
  store double 0.000000e+00, double addrspace(1)* %31, align 8, !tbaa !7
  %32 = icmp sgt i32 %5, 0
  br i1 %32, label %33, label %115

33:                                               ; preds = %27
  %34 = mul nsw i32 %15, %5
  %35 = and i32 %5, 3
  %36 = icmp ult i32 %5, 4
  br i1 %36, label %93, label %37

37:                                               ; preds = %33
  %38 = and i32 %5, -4
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi double [ 0.000000e+00, %37 ], [ %89, %39 ]
  %41 = phi i32 [ 0, %37 ], [ %90, %39 ]
  %42 = phi i32 [ 0, %37 ], [ %91, %39 ]
  %43 = mul nsw i32 %41, %3
  %44 = add nsw i32 %43, %23
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7
  %48 = add nsw i32 %41, %34
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %0, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %52 = fmul contract double %47, %51
  %53 = fadd contract double %40, %52
  store double %53, double addrspace(1)* %31, align 8, !tbaa !7
  %54 = or i32 %41, 1
  %55 = mul nsw i32 %54, %3
  %56 = add nsw i32 %55, %23
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %1, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = add nsw i32 %54, %34
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %64 = fmul contract double %59, %63
  %65 = fadd contract double %53, %64
  store double %65, double addrspace(1)* %31, align 8, !tbaa !7
  %66 = or i32 %41, 2
  %67 = mul nsw i32 %66, %3
  %68 = add nsw i32 %67, %23
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double addrspace(1)* %1, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %72 = add nsw i32 %66, %34
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %0, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  %76 = fmul contract double %71, %75
  %77 = fadd contract double %65, %76
  store double %77, double addrspace(1)* %31, align 8, !tbaa !7
  %78 = or i32 %41, 3
  %79 = mul nsw i32 %78, %3
  %80 = add nsw i32 %79, %23
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double addrspace(1)* %1, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7
  %84 = add nsw i32 %78, %34
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %0, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7
  %88 = fmul contract double %83, %87
  %89 = fadd contract double %77, %88
  store double %89, double addrspace(1)* %31, align 8, !tbaa !7
  %90 = add nuw nsw i32 %41, 4
  %91 = add i32 %42, 4
  %92 = icmp eq i32 %91, %38
  br i1 %92, label %93, label %39, !llvm.loop !11

93:                                               ; preds = %39, %33
  %94 = phi double [ 0.000000e+00, %33 ], [ %89, %39 ]
  %95 = phi i32 [ 0, %33 ], [ %90, %39 ]
  %96 = icmp eq i32 %35, 0
  br i1 %96, label %115, label %97

97:                                               ; preds = %93, %97
  %98 = phi double [ %111, %97 ], [ %94, %93 ]
  %99 = phi i32 [ %112, %97 ], [ %95, %93 ]
  %100 = phi i32 [ %113, %97 ], [ 0, %93 ]
  %101 = mul nsw i32 %99, %3
  %102 = add nsw i32 %101, %23
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, double addrspace(1)* %1, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7
  %106 = add nsw i32 %99, %34
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds double, double addrspace(1)* %0, i64 %107
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7
  %110 = fmul contract double %105, %109
  %111 = fadd contract double %98, %110
  store double %111, double addrspace(1)* %31, align 8, !tbaa !7
  %112 = add nuw nsw i32 %99, 1
  %113 = add i32 %100, 1
  %114 = icmp eq i32 %113, %35
  br i1 %114, label %115, label %97, !llvm.loop !13

115:                                              ; preds = %93, %97, %27, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
