; ModuleID = '../data/hip_kernels/7733/50/main.cu'
source_filename = "../data/hip_kernels/7733/50/main.cu"
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
  %27 = icmp sgt i32 %5, 0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %116

29:                                               ; preds = %6
  %30 = mul nsw i32 %15, %5
  %31 = mul nsw i32 %15, %3
  %32 = add nsw i32 %31, %23
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %36 = and i32 %5, 3
  %37 = icmp ult i32 %5, 4
  br i1 %37, label %94, label %38

38:                                               ; preds = %29
  %39 = and i32 %5, -4
  br label %40

40:                                               ; preds = %40, %38
  %41 = phi double [ %35, %38 ], [ %90, %40 ]
  %42 = phi i32 [ 0, %38 ], [ %91, %40 ]
  %43 = phi i32 [ 0, %38 ], [ %92, %40 ]
  %44 = mul nsw i32 %42, %3
  %45 = add nsw i32 %44, %23
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %49 = add nsw i32 %42, %30
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %53 = fmul contract double %48, %52
  %54 = fadd contract double %41, %53
  store double %54, double addrspace(1)* %34, align 8, !tbaa !7
  %55 = or i32 %42, 1
  %56 = mul nsw i32 %55, %3
  %57 = add nsw i32 %56, %23
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7
  %61 = add nsw i32 %55, %30
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7
  %65 = fmul contract double %60, %64
  %66 = fadd contract double %54, %65
  store double %66, double addrspace(1)* %34, align 8, !tbaa !7
  %67 = or i32 %42, 2
  %68 = mul nsw i32 %67, %3
  %69 = add nsw i32 %68, %23
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %1, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7
  %73 = add nsw i32 %67, %30
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7
  %77 = fmul contract double %72, %76
  %78 = fadd contract double %66, %77
  store double %78, double addrspace(1)* %34, align 8, !tbaa !7
  %79 = or i32 %42, 3
  %80 = mul nsw i32 %79, %3
  %81 = add nsw i32 %80, %23
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds double, double addrspace(1)* %1, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  %85 = add nsw i32 %79, %30
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7
  %89 = fmul contract double %84, %88
  %90 = fadd contract double %78, %89
  store double %90, double addrspace(1)* %34, align 8, !tbaa !7
  %91 = add nuw nsw i32 %42, 4
  %92 = add i32 %43, 4
  %93 = icmp eq i32 %92, %39
  br i1 %93, label %94, label %40, !llvm.loop !11

94:                                               ; preds = %40, %29
  %95 = phi double [ %35, %29 ], [ %90, %40 ]
  %96 = phi i32 [ 0, %29 ], [ %91, %40 ]
  %97 = icmp eq i32 %36, 0
  br i1 %97, label %116, label %98

98:                                               ; preds = %94, %98
  %99 = phi double [ %112, %98 ], [ %95, %94 ]
  %100 = phi i32 [ %113, %98 ], [ %96, %94 ]
  %101 = phi i32 [ %114, %98 ], [ 0, %94 ]
  %102 = mul nsw i32 %100, %3
  %103 = add nsw i32 %102, %23
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %1, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !7
  %107 = add nsw i32 %100, %30
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, double addrspace(1)* %0, i64 %108
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !7
  %111 = fmul contract double %106, %110
  %112 = fadd contract double %99, %111
  store double %112, double addrspace(1)* %34, align 8, !tbaa !7
  %113 = add nuw nsw i32 %100, 1
  %114 = add i32 %101, 1
  %115 = icmp eq i32 %114, %36
  br i1 %115, label %116, label %98, !llvm.loop !13

116:                                              ; preds = %94, %98, %6
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
