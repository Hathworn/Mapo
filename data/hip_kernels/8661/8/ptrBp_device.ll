; ModuleID = '../data/hip_kernels/8661/8/main.cu'
source_filename = "../data/hip_kernels/8661/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5ptrBpPiS_PdS0_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %21 = add i32 %19, %20
  %22 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %112

24:                                               ; preds = %4
  %25 = mul nsw i32 %21, %22
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double addrspace(1)* %2, i64 %26
  %28 = mul nsw i32 %13, %22
  %29 = sext i32 %28 to i64
  %30 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = mul nsw i32 %30, %21
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %3, i64 %32
  %34 = sext i32 %13 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %33, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !11, !amdgpu.noclobber !5
  %37 = getelementptr double, double addrspace(1)* %27, i64 %29
  %38 = and i32 %22, 7
  %39 = icmp ult i32 %22, 8
  br i1 %39, label %96, label %40

40:                                               ; preds = %24
  %41 = and i32 %22, -8
  br label %42

42:                                               ; preds = %42, %40
  %43 = phi double [ %36, %40 ], [ %92, %42 ]
  %44 = phi i32 [ 0, %40 ], [ %93, %42 ]
  %45 = phi i32 [ 0, %40 ], [ %94, %42 ]
  %46 = zext i32 %44 to i64
  %47 = getelementptr double, double addrspace(1)* %37, i64 %46
  %48 = getelementptr inbounds double, double addrspace(1)* %47, i64 %46
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !11
  %50 = fadd contract double %43, %49
  store double %50, double addrspace(1)* %35, align 8, !tbaa !11
  %51 = or i32 %44, 1
  %52 = zext i32 %51 to i64
  %53 = getelementptr double, double addrspace(1)* %37, i64 %52
  %54 = getelementptr inbounds double, double addrspace(1)* %53, i64 %52
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !11
  %56 = fadd contract double %50, %55
  store double %56, double addrspace(1)* %35, align 8, !tbaa !11
  %57 = or i32 %44, 2
  %58 = zext i32 %57 to i64
  %59 = getelementptr double, double addrspace(1)* %37, i64 %58
  %60 = getelementptr inbounds double, double addrspace(1)* %59, i64 %58
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !11
  %62 = fadd contract double %56, %61
  store double %62, double addrspace(1)* %35, align 8, !tbaa !11
  %63 = or i32 %44, 3
  %64 = zext i32 %63 to i64
  %65 = getelementptr double, double addrspace(1)* %37, i64 %64
  %66 = getelementptr inbounds double, double addrspace(1)* %65, i64 %64
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !11
  %68 = fadd contract double %62, %67
  store double %68, double addrspace(1)* %35, align 8, !tbaa !11
  %69 = or i32 %44, 4
  %70 = zext i32 %69 to i64
  %71 = getelementptr double, double addrspace(1)* %37, i64 %70
  %72 = getelementptr inbounds double, double addrspace(1)* %71, i64 %70
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !11
  %74 = fadd contract double %68, %73
  store double %74, double addrspace(1)* %35, align 8, !tbaa !11
  %75 = or i32 %44, 5
  %76 = zext i32 %75 to i64
  %77 = getelementptr double, double addrspace(1)* %37, i64 %76
  %78 = getelementptr inbounds double, double addrspace(1)* %77, i64 %76
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !11
  %80 = fadd contract double %74, %79
  store double %80, double addrspace(1)* %35, align 8, !tbaa !11
  %81 = or i32 %44, 6
  %82 = zext i32 %81 to i64
  %83 = getelementptr double, double addrspace(1)* %37, i64 %82
  %84 = getelementptr inbounds double, double addrspace(1)* %83, i64 %82
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !11
  %86 = fadd contract double %80, %85
  store double %86, double addrspace(1)* %35, align 8, !tbaa !11
  %87 = or i32 %44, 7
  %88 = zext i32 %87 to i64
  %89 = getelementptr double, double addrspace(1)* %37, i64 %88
  %90 = getelementptr inbounds double, double addrspace(1)* %89, i64 %88
  %91 = load double, double addrspace(1)* %90, align 8, !tbaa !11
  %92 = fadd contract double %86, %91
  store double %92, double addrspace(1)* %35, align 8, !tbaa !11
  %93 = add nuw nsw i32 %44, 8
  %94 = add i32 %45, 8
  %95 = icmp eq i32 %94, %41
  br i1 %95, label %96, label %42, !llvm.loop !13

96:                                               ; preds = %42, %24
  %97 = phi double [ %36, %24 ], [ %92, %42 ]
  %98 = phi i32 [ 0, %24 ], [ %93, %42 ]
  %99 = icmp eq i32 %38, 0
  br i1 %99, label %112, label %100

100:                                              ; preds = %96, %100
  %101 = phi double [ %108, %100 ], [ %97, %96 ]
  %102 = phi i32 [ %109, %100 ], [ %98, %96 ]
  %103 = phi i32 [ %110, %100 ], [ 0, %96 ]
  %104 = zext i32 %102 to i64
  %105 = getelementptr double, double addrspace(1)* %37, i64 %104
  %106 = getelementptr inbounds double, double addrspace(1)* %105, i64 %104
  %107 = load double, double addrspace(1)* %106, align 8, !tbaa !11
  %108 = fadd contract double %101, %107
  store double %108, double addrspace(1)* %35, align 8, !tbaa !11
  %109 = add nuw nsw i32 %102, 1
  %110 = add i32 %103, 1
  %111 = icmp eq i32 %110, %38
  br i1 %111, label %112, label %100, !llvm.loop !15

112:                                              ; preds = %96, %100, %4
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
