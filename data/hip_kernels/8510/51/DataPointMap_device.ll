; ModuleID = '../data/hip_kernels/8510/51/main.cu'
source_filename = "../data/hip_kernels/8510/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z12DataPointMapiPKdS0_PdS0_i(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readnone %2, double addrspace(1)* nocapture writeonly %3, double addrspace(1)* nocapture readonly %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = zext i32 %7 to i64
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = zext i32 %9 to i64
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i64
  %16 = mul nuw nsw i64 %15, %10
  %17 = add nuw nsw i64 %16, %8
  %18 = sext i32 %0 to i64
  %19 = icmp slt i64 %17, %18
  br i1 %19, label %20, label %107

20:                                               ; preds = %6
  %21 = sext i32 %5 to i64
  %22 = mul nsw i64 %17, %21
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %24 = getelementptr inbounds double, double addrspace(1)* %3, i64 %22
  %25 = icmp sgt i32 %5, 0
  br i1 %25, label %26, label %107

26:                                               ; preds = %20
  %27 = and i64 %21, 7
  %28 = icmp ult i32 %5, 8
  br i1 %28, label %92, label %29

29:                                               ; preds = %26
  %30 = and i64 %21, -8
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi i64 [ 0, %29 ], [ %89, %31 ]
  %33 = phi i64 [ 0, %29 ], [ %90, %31 ]
  %34 = getelementptr inbounds double, double addrspace(1)* %23, i64 %32
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7
  %36 = getelementptr inbounds double, double addrspace(1)* %4, i64 %32
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %38 = fadd contract double %35, %37
  %39 = getelementptr inbounds double, double addrspace(1)* %24, i64 %32
  store double %38, double addrspace(1)* %39, align 8, !tbaa !7
  %40 = or i64 %32, 1
  %41 = getelementptr inbounds double, double addrspace(1)* %23, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7
  %43 = getelementptr inbounds double, double addrspace(1)* %4, i64 %40
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !7
  %45 = fadd contract double %42, %44
  %46 = getelementptr inbounds double, double addrspace(1)* %24, i64 %40
  store double %45, double addrspace(1)* %46, align 8, !tbaa !7
  %47 = or i64 %32, 2
  %48 = getelementptr inbounds double, double addrspace(1)* %23, i64 %47
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !7
  %50 = getelementptr inbounds double, double addrspace(1)* %4, i64 %47
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %52 = fadd contract double %49, %51
  %53 = getelementptr inbounds double, double addrspace(1)* %24, i64 %47
  store double %52, double addrspace(1)* %53, align 8, !tbaa !7
  %54 = or i64 %32, 3
  %55 = getelementptr inbounds double, double addrspace(1)* %23, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7
  %57 = getelementptr inbounds double, double addrspace(1)* %4, i64 %54
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7
  %59 = fadd contract double %56, %58
  %60 = getelementptr inbounds double, double addrspace(1)* %24, i64 %54
  store double %59, double addrspace(1)* %60, align 8, !tbaa !7
  %61 = or i64 %32, 4
  %62 = getelementptr inbounds double, double addrspace(1)* %23, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7
  %64 = getelementptr inbounds double, double addrspace(1)* %4, i64 %61
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %66 = fadd contract double %63, %65
  %67 = getelementptr inbounds double, double addrspace(1)* %24, i64 %61
  store double %66, double addrspace(1)* %67, align 8, !tbaa !7
  %68 = or i64 %32, 5
  %69 = getelementptr inbounds double, double addrspace(1)* %23, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = getelementptr inbounds double, double addrspace(1)* %4, i64 %68
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7
  %73 = fadd contract double %70, %72
  %74 = getelementptr inbounds double, double addrspace(1)* %24, i64 %68
  store double %73, double addrspace(1)* %74, align 8, !tbaa !7
  %75 = or i64 %32, 6
  %76 = getelementptr inbounds double, double addrspace(1)* %23, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7
  %78 = getelementptr inbounds double, double addrspace(1)* %4, i64 %75
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !7
  %80 = fadd contract double %77, %79
  %81 = getelementptr inbounds double, double addrspace(1)* %24, i64 %75
  store double %80, double addrspace(1)* %81, align 8, !tbaa !7
  %82 = or i64 %32, 7
  %83 = getelementptr inbounds double, double addrspace(1)* %23, i64 %82
  %84 = load double, double addrspace(1)* %83, align 8, !tbaa !7
  %85 = getelementptr inbounds double, double addrspace(1)* %4, i64 %82
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7
  %87 = fadd contract double %84, %86
  %88 = getelementptr inbounds double, double addrspace(1)* %24, i64 %82
  store double %87, double addrspace(1)* %88, align 8, !tbaa !7
  %89 = add nuw nsw i64 %32, 8
  %90 = add nuw i64 %33, 8
  %91 = icmp eq i64 %90, %30
  br i1 %91, label %92, label %31, !llvm.loop !11

92:                                               ; preds = %31, %26
  %93 = phi i64 [ 0, %26 ], [ %89, %31 ]
  %94 = icmp eq i64 %27, 0
  br i1 %94, label %107, label %95

95:                                               ; preds = %92, %95
  %96 = phi i64 [ %104, %95 ], [ %93, %92 ]
  %97 = phi i64 [ %105, %95 ], [ 0, %92 ]
  %98 = getelementptr inbounds double, double addrspace(1)* %23, i64 %96
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !7
  %100 = getelementptr inbounds double, double addrspace(1)* %4, i64 %96
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7
  %102 = fadd contract double %99, %101
  %103 = getelementptr inbounds double, double addrspace(1)* %24, i64 %96
  store double %102, double addrspace(1)* %103, align 8, !tbaa !7
  %104 = add nuw nsw i64 %96, 1
  %105 = add i64 %97, 1
  %106 = icmp eq i64 %105, %27
  br i1 %106, label %107, label %95, !llvm.loop !13

107:                                              ; preds = %92, %95, %20, %6
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
