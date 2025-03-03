; ModuleID = '../data/hip_kernels/7676/7/main.cu'
source_filename = "../data/hip_kernels/7676/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10getWeightsPKdS0_Pdmmm(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2, i64 %3, i64 %4, i64 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = zext i32 %7 to i64
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = zext i32 %17 to i64
  %19 = icmp ult i64 %18, %3
  %20 = icmp ult i64 %8, %5
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %131

22:                                               ; preds = %6
  %23 = mul i64 %8, %3
  %24 = add i64 %23, %18
  %25 = getelementptr inbounds double, double addrspace(1)* %2, i64 %24
  store double 0.000000e+00, double addrspace(1)* %25, align 8, !tbaa !7
  %26 = icmp eq i64 %4, 0
  br i1 %26, label %131, label %27

27:                                               ; preds = %22
  %28 = mul i64 %8, %4
  %29 = mul i64 %18, %4
  %30 = and i64 %4, 7
  %31 = icmp ult i64 %4, 8
  br i1 %31, label %112, label %32

32:                                               ; preds = %27
  %33 = and i64 %4, -8
  br label %34

34:                                               ; preds = %34, %32
  %35 = phi double [ 0.000000e+00, %32 ], [ %108, %34 ]
  %36 = phi i64 [ 0, %32 ], [ %109, %34 ]
  %37 = phi i64 [ 0, %32 ], [ %110, %34 ]
  %38 = add i64 %36, %28
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7
  %41 = add i64 %36, %29
  %42 = getelementptr inbounds double, double addrspace(1)* %1, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7
  %44 = fmul contract double %40, %43
  %45 = fadd contract double %35, %44
  store double %45, double addrspace(1)* %25, align 8, !tbaa !7
  %46 = or i64 %36, 1
  %47 = add i64 %46, %28
  %48 = getelementptr inbounds double, double addrspace(1)* %0, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = add i64 %46, %29
  %51 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %53 = fmul contract double %49, %52
  %54 = fadd contract double %45, %53
  store double %54, double addrspace(1)* %25, align 8, !tbaa !7
  %55 = or i64 %36, 2
  %56 = add i64 %55, %28
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7
  %59 = add i64 %55, %29
  %60 = getelementptr inbounds double, double addrspace(1)* %1, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7
  %62 = fmul contract double %58, %61
  %63 = fadd contract double %54, %62
  store double %63, double addrspace(1)* %25, align 8, !tbaa !7
  %64 = or i64 %36, 3
  %65 = add i64 %64, %28
  %66 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7
  %68 = add i64 %64, %29
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = fmul contract double %67, %70
  %72 = fadd contract double %63, %71
  store double %72, double addrspace(1)* %25, align 8, !tbaa !7
  %73 = or i64 %36, 4
  %74 = add i64 %73, %28
  %75 = getelementptr inbounds double, double addrspace(1)* %0, i64 %74
  %76 = load double, double addrspace(1)* %75, align 8, !tbaa !7
  %77 = add i64 %73, %29
  %78 = getelementptr inbounds double, double addrspace(1)* %1, i64 %77
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7
  %80 = fmul contract double %76, %79
  %81 = fadd contract double %72, %80
  store double %81, double addrspace(1)* %25, align 8, !tbaa !7
  %82 = or i64 %36, 5
  %83 = add i64 %82, %28
  %84 = getelementptr inbounds double, double addrspace(1)* %0, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7
  %86 = add i64 %82, %29
  %87 = getelementptr inbounds double, double addrspace(1)* %1, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !7
  %89 = fmul contract double %85, %88
  %90 = fadd contract double %81, %89
  store double %90, double addrspace(1)* %25, align 8, !tbaa !7
  %91 = or i64 %36, 6
  %92 = add i64 %91, %28
  %93 = getelementptr inbounds double, double addrspace(1)* %0, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7
  %95 = add i64 %91, %29
  %96 = getelementptr inbounds double, double addrspace(1)* %1, i64 %95
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !7
  %98 = fmul contract double %94, %97
  %99 = fadd contract double %90, %98
  store double %99, double addrspace(1)* %25, align 8, !tbaa !7
  %100 = or i64 %36, 7
  %101 = add i64 %100, %28
  %102 = getelementptr inbounds double, double addrspace(1)* %0, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !7
  %104 = add i64 %100, %29
  %105 = getelementptr inbounds double, double addrspace(1)* %1, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !7
  %107 = fmul contract double %103, %106
  %108 = fadd contract double %99, %107
  store double %108, double addrspace(1)* %25, align 8, !tbaa !7
  %109 = add nuw i64 %36, 8
  %110 = add i64 %37, 8
  %111 = icmp eq i64 %110, %33
  br i1 %111, label %112, label %34, !llvm.loop !11

112:                                              ; preds = %34, %27
  %113 = phi double [ 0.000000e+00, %27 ], [ %108, %34 ]
  %114 = phi i64 [ 0, %27 ], [ %109, %34 ]
  %115 = icmp eq i64 %30, 0
  br i1 %115, label %131, label %116

116:                                              ; preds = %112, %116
  %117 = phi double [ %127, %116 ], [ %113, %112 ]
  %118 = phi i64 [ %128, %116 ], [ %114, %112 ]
  %119 = phi i64 [ %129, %116 ], [ 0, %112 ]
  %120 = add i64 %118, %28
  %121 = getelementptr inbounds double, double addrspace(1)* %0, i64 %120
  %122 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %123 = add i64 %118, %29
  %124 = getelementptr inbounds double, double addrspace(1)* %1, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7
  %126 = fmul contract double %122, %125
  %127 = fadd contract double %117, %126
  store double %127, double addrspace(1)* %25, align 8, !tbaa !7
  %128 = add nuw i64 %118, 1
  %129 = add i64 %119, 1
  %130 = icmp eq i64 %129, %30
  br i1 %130, label %131, label %116, !llvm.loop !13

131:                                              ; preds = %112, %116, %22, %6
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
