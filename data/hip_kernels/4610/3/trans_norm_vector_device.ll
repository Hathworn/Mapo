; ModuleID = '../data/hip_kernels/4610/3/main.cu'
source_filename = "../data/hip_kernels/4610/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17trans_norm_vectorPdS_S_S_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readnone %2, double addrspace(1)* nocapture %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %3, i64 %16
  store double 0.000000e+00, double addrspace(1)* %17, align 8, !tbaa !7
  %18 = icmp sgt i32 %5, 0
  br i1 %18, label %19, label %131

19:                                               ; preds = %6
  %20 = mul nsw i32 %15, %5
  %21 = and i32 %5, 7
  %22 = icmp ult i32 %5, 8
  br i1 %22, label %111, label %23

23:                                               ; preds = %19
  %24 = and i32 %5, -8
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi double [ 0.000000e+00, %23 ], [ %107, %25 ]
  %27 = phi i32 [ 0, %23 ], [ %108, %25 ]
  %28 = phi i32 [ 0, %23 ], [ %109, %25 ]
  %29 = add nsw i32 %27, %20
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds double, double addrspace(1)* %0, i64 %30
  %32 = load double, double addrspace(1)* %31, align 8, !tbaa !7
  %33 = zext i32 %27 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %36 = fmul contract double %32, %35
  %37 = fadd contract double %26, %36
  store double %37, double addrspace(1)* %17, align 8, !tbaa !7
  %38 = or i32 %27, 1
  %39 = add nsw i32 %38, %20
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7
  %43 = zext i32 %38 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %1, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = fmul contract double %42, %45
  %47 = fadd contract double %37, %46
  store double %47, double addrspace(1)* %17, align 8, !tbaa !7
  %48 = or i32 %27, 2
  %49 = add nsw i32 %48, %20
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7
  %53 = zext i32 %48 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %1, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7
  %56 = fmul contract double %52, %55
  %57 = fadd contract double %47, %56
  store double %57, double addrspace(1)* %17, align 8, !tbaa !7
  %58 = or i32 %27, 3
  %59 = add nsw i32 %58, %20
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7
  %63 = zext i32 %58 to i64
  %64 = getelementptr inbounds double, double addrspace(1)* %1, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %66 = fmul contract double %62, %65
  %67 = fadd contract double %57, %66
  store double %67, double addrspace(1)* %17, align 8, !tbaa !7
  %68 = or i32 %27, 4
  %69 = add nsw i32 %68, %20
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7
  %73 = zext i32 %68 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %1, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7
  %76 = fmul contract double %72, %75
  %77 = fadd contract double %67, %76
  store double %77, double addrspace(1)* %17, align 8, !tbaa !7
  %78 = or i32 %27, 5
  %79 = add nsw i32 %78, %20
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %0, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !7
  %83 = zext i32 %78 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %1, i64 %83
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !7
  %86 = fmul contract double %82, %85
  %87 = fadd contract double %77, %86
  store double %87, double addrspace(1)* %17, align 8, !tbaa !7
  %88 = or i32 %27, 6
  %89 = add nsw i32 %88, %20
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %0, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7
  %93 = zext i32 %88 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %1, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !7
  %96 = fmul contract double %92, %95
  %97 = fadd contract double %87, %96
  store double %97, double addrspace(1)* %17, align 8, !tbaa !7
  %98 = or i32 %27, 7
  %99 = add nsw i32 %98, %20
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %0, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !7
  %103 = zext i32 %98 to i64
  %104 = getelementptr inbounds double, double addrspace(1)* %1, i64 %103
  %105 = load double, double addrspace(1)* %104, align 8, !tbaa !7
  %106 = fmul contract double %102, %105
  %107 = fadd contract double %97, %106
  store double %107, double addrspace(1)* %17, align 8, !tbaa !7
  %108 = add nuw nsw i32 %27, 8
  %109 = add i32 %28, 8
  %110 = icmp eq i32 %109, %24
  br i1 %110, label %111, label %25, !llvm.loop !11

111:                                              ; preds = %25, %19
  %112 = phi double [ 0.000000e+00, %19 ], [ %107, %25 ]
  %113 = phi i32 [ 0, %19 ], [ %108, %25 ]
  %114 = icmp eq i32 %21, 0
  br i1 %114, label %131, label %115

115:                                              ; preds = %111, %115
  %116 = phi double [ %127, %115 ], [ %112, %111 ]
  %117 = phi i32 [ %128, %115 ], [ %113, %111 ]
  %118 = phi i32 [ %129, %115 ], [ 0, %111 ]
  %119 = add nsw i32 %117, %20
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds double, double addrspace(1)* %0, i64 %120
  %122 = load double, double addrspace(1)* %121, align 8, !tbaa !7
  %123 = zext i32 %117 to i64
  %124 = getelementptr inbounds double, double addrspace(1)* %1, i64 %123
  %125 = load double, double addrspace(1)* %124, align 8, !tbaa !7
  %126 = fmul contract double %122, %125
  %127 = fadd contract double %116, %126
  store double %127, double addrspace(1)* %17, align 8, !tbaa !7
  %128 = add nuw nsw i32 %117, 1
  %129 = add i32 %118, 1
  %130 = icmp eq i32 %129, %21
  br i1 %130, label %131, label %115, !llvm.loop !13

131:                                              ; preds = %111, %115, %6
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
