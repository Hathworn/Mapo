; ModuleID = '../data/hip_kernels/4610/2/main.cu'
source_filename = "../data/hip_kernels/4610/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10calcsymmatPdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add nuw nsw i32 %12, 1
  %14 = add i32 %13, %11
  %15 = add nsw i32 %2, 1
  %16 = icmp sgt i32 %14, %15
  %17 = icmp sgt i32 %14, %2
  %18 = or i1 %16, %17
  br i1 %18, label %116, label %19

19:                                               ; preds = %4
  %20 = mul nsw i32 %14, %15
  %21 = icmp slt i32 %3, 1
  %22 = and i32 %3, 3
  %23 = icmp ult i32 %3, 4
  %24 = and i32 %3, -4
  %25 = icmp eq i32 %22, 0
  br label %26

26:                                               ; preds = %19, %108
  %27 = phi i32 [ %14, %19 ], [ %114, %108 ]
  %28 = add nsw i32 %27, %20
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %1, i64 %29
  store double 0.000000e+00, double addrspace(1)* %30, align 8, !tbaa !7
  br i1 %21, label %108, label %31

31:                                               ; preds = %26
  br i1 %23, label %86, label %32

32:                                               ; preds = %31, %32
  %33 = phi double [ %82, %32 ], [ 0.000000e+00, %31 ]
  %34 = phi i32 [ %83, %32 ], [ 1, %31 ]
  %35 = phi i32 [ %84, %32 ], [ 0, %31 ]
  %36 = mul nsw i32 %34, %15
  %37 = add nsw i32 %36, %14
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7
  %41 = add nsw i32 %36, %27
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, double addrspace(1)* %0, i64 %42
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7
  %45 = fmul contract double %40, %44
  %46 = fadd contract double %33, %45
  store double %46, double addrspace(1)* %30, align 8, !tbaa !7
  %47 = add nuw nsw i32 %34, 1
  %48 = mul nsw i32 %47, %15
  %49 = add nsw i32 %48, %14
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %53 = add nsw i32 %48, %27
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7
  %57 = fmul contract double %52, %56
  %58 = fadd contract double %46, %57
  store double %58, double addrspace(1)* %30, align 8, !tbaa !7
  %59 = add nuw nsw i32 %34, 2
  %60 = mul nsw i32 %59, %15
  %61 = add nsw i32 %60, %14
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7
  %65 = add nsw i32 %60, %27
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %0, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7
  %69 = fmul contract double %64, %68
  %70 = fadd contract double %58, %69
  store double %70, double addrspace(1)* %30, align 8, !tbaa !7
  %71 = add nuw i32 %34, 3
  %72 = mul nsw i32 %71, %15
  %73 = add nsw i32 %72, %14
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7
  %77 = add nsw i32 %72, %27
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %0, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !7
  %81 = fmul contract double %76, %80
  %82 = fadd contract double %70, %81
  store double %82, double addrspace(1)* %30, align 8, !tbaa !7
  %83 = add nuw i32 %34, 4
  %84 = add i32 %35, 4
  %85 = icmp eq i32 %84, %24
  br i1 %85, label %86, label %32, !llvm.loop !11

86:                                               ; preds = %32, %31
  %87 = phi double [ undef, %31 ], [ %82, %32 ]
  %88 = phi double [ 0.000000e+00, %31 ], [ %82, %32 ]
  %89 = phi i32 [ 1, %31 ], [ %83, %32 ]
  br i1 %25, label %108, label %90

90:                                               ; preds = %86, %90
  %91 = phi double [ %104, %90 ], [ %88, %86 ]
  %92 = phi i32 [ %105, %90 ], [ %89, %86 ]
  %93 = phi i32 [ %106, %90 ], [ 0, %86 ]
  %94 = mul nsw i32 %92, %15
  %95 = add nsw i32 %94, %14
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, double addrspace(1)* %0, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !7
  %99 = add nsw i32 %94, %27
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %0, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !7
  %103 = fmul contract double %98, %102
  %104 = fadd contract double %91, %103
  store double %104, double addrspace(1)* %30, align 8, !tbaa !7
  %105 = add nuw i32 %92, 1
  %106 = add i32 %93, 1
  %107 = icmp eq i32 %106, %22
  br i1 %107, label %108, label %90, !llvm.loop !13

108:                                              ; preds = %86, %90, %26
  %109 = phi double [ 0.000000e+00, %26 ], [ %87, %86 ], [ %104, %90 ]
  %110 = mul nsw i32 %27, %15
  %111 = add nsw i32 %110, %14
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %1, i64 %112
  store double %109, double addrspace(1)* %113, align 8, !tbaa !7
  %114 = add nsw i32 %27, 1
  %115 = icmp slt i32 %27, %2
  br i1 %115, label %26, label %116, !llvm.loop !15

116:                                              ; preds = %108, %4
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
!15 = distinct !{!15, !12}
