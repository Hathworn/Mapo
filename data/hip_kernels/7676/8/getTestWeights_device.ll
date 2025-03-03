; ModuleID = '../data/hip_kernels/7676/8/main.cu'
source_filename = "../data/hip_kernels/7676/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14getTestWeightsPKdS0_S0_Pdmmm(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture %3, i64 %4, i64 %5, i64 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = zext i32 %8 to i64
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = zext i32 %18 to i64
  %20 = icmp ult i64 %19, %4
  %21 = icmp ult i64 %9, %6
  %22 = select i1 %20, i1 %21, i1 false
  br i1 %22, label %23, label %121

23:                                               ; preds = %7
  %24 = mul i64 %9, %4
  %25 = add i64 %24, %19
  %26 = getelementptr inbounds double, double addrspace(1)* %3, i64 %25
  store double 0.000000e+00, double addrspace(1)* %26, align 8, !tbaa !7
  %27 = icmp eq i64 %5, 0
  br i1 %27, label %121, label %28

28:                                               ; preds = %23
  %29 = mul i64 %19, %5
  %30 = mul i64 %9, %5
  %31 = and i64 %5, 3
  %32 = icmp ult i64 %5, 4
  br i1 %32, label %97, label %33

33:                                               ; preds = %28
  %34 = and i64 %5, -4
  br label %35

35:                                               ; preds = %35, %33
  %36 = phi double [ 0.000000e+00, %33 ], [ %93, %35 ]
  %37 = phi i64 [ 0, %33 ], [ %94, %35 ]
  %38 = phi i64 [ 0, %33 ], [ %95, %35 ]
  %39 = add i64 %37, %29
  %40 = getelementptr inbounds double, double addrspace(1)* %2, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7
  %44 = fsub contract double %41, %43
  %45 = fcmp contract olt double %44, 0.000000e+00
  %46 = select i1 %45, double 0.000000e+00, double %44
  %47 = add i64 %37, %30
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = fmul contract double %49, %46
  %51 = fadd contract double %36, %50
  store double %51, double addrspace(1)* %26, align 8, !tbaa !7
  %52 = or i64 %37, 1
  %53 = add i64 %52, %29
  %54 = getelementptr inbounds double, double addrspace(1)* %2, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7
  %56 = getelementptr inbounds double, double addrspace(1)* %1, i64 %52
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7
  %58 = fsub contract double %55, %57
  %59 = fcmp contract olt double %58, 0.000000e+00
  %60 = select i1 %59, double 0.000000e+00, double %58
  %61 = add i64 %52, %30
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %64 = fmul contract double %63, %60
  %65 = fadd contract double %51, %64
  store double %65, double addrspace(1)* %26, align 8, !tbaa !7
  %66 = or i64 %37, 2
  %67 = add i64 %66, %29
  %68 = getelementptr inbounds double, double addrspace(1)* %2, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7
  %70 = getelementptr inbounds double, double addrspace(1)* %1, i64 %66
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7
  %72 = fsub contract double %69, %71
  %73 = fcmp contract olt double %72, 0.000000e+00
  %74 = select i1 %73, double 0.000000e+00, double %72
  %75 = add i64 %66, %30
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7
  %78 = fmul contract double %77, %74
  %79 = fadd contract double %65, %78
  store double %79, double addrspace(1)* %26, align 8, !tbaa !7
  %80 = or i64 %37, 3
  %81 = add i64 %80, %29
  %82 = getelementptr inbounds double, double addrspace(1)* %2, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7
  %84 = getelementptr inbounds double, double addrspace(1)* %1, i64 %80
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7
  %86 = fsub contract double %83, %85
  %87 = fcmp contract olt double %86, 0.000000e+00
  %88 = select i1 %87, double 0.000000e+00, double %86
  %89 = add i64 %80, %30
  %90 = getelementptr inbounds double, double addrspace(1)* %0, i64 %89
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !7
  %92 = fmul contract double %91, %88
  %93 = fadd contract double %79, %92
  store double %93, double addrspace(1)* %26, align 8, !tbaa !7
  %94 = add nuw i64 %37, 4
  %95 = add i64 %38, 4
  %96 = icmp eq i64 %95, %34
  br i1 %96, label %97, label %35, !llvm.loop !11

97:                                               ; preds = %35, %28
  %98 = phi double [ 0.000000e+00, %28 ], [ %93, %35 ]
  %99 = phi i64 [ 0, %28 ], [ %94, %35 ]
  %100 = icmp eq i64 %31, 0
  br i1 %100, label %121, label %101

101:                                              ; preds = %97, %101
  %102 = phi double [ %117, %101 ], [ %98, %97 ]
  %103 = phi i64 [ %118, %101 ], [ %99, %97 ]
  %104 = phi i64 [ %119, %101 ], [ 0, %97 ]
  %105 = add i64 %103, %29
  %106 = getelementptr inbounds double, double addrspace(1)* %2, i64 %105
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !7
  %108 = getelementptr inbounds double, double addrspace(1)* %1, i64 %103
  %109 = load double, double addrspace(1)* %108, align 8, !tbaa !7
  %110 = fsub contract double %107, %109
  %111 = fcmp contract olt double %110, 0.000000e+00
  %112 = select i1 %111, double 0.000000e+00, double %110
  %113 = add i64 %103, %30
  %114 = getelementptr inbounds double, double addrspace(1)* %0, i64 %113
  %115 = load double, double addrspace(1)* %114, align 8, !tbaa !7
  %116 = fmul contract double %115, %112
  %117 = fadd contract double %102, %116
  store double %117, double addrspace(1)* %26, align 8, !tbaa !7
  %118 = add nuw i64 %103, 1
  %119 = add i64 %104, 1
  %120 = icmp eq i64 %119, %31
  br i1 %120, label %121, label %101, !llvm.loop !13

121:                                              ; preds = %97, %101, %23, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

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
