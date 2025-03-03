; ModuleID = '../data/hip_kernels/2006/28/main.cu'
source_filename = "../data/hip_kernels/2006/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @reducePartial(i32 %0, i8 addrspace(1)* nocapture readonly %1, i8 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = bitcast i8 addrspace(1)* %1 to float addrspace(1)*
  %5 = bitcast i8 addrspace(1)* %2 to float addrspace(1)*
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @sdata, i32 0, i32 %10
  %13 = getelementptr inbounds double, double addrspace(3)* %12, i32 %10
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = shl i32 %11, 1
  %16 = mul i32 %15, %10
  %17 = add i32 %16, %14
  %18 = icmp ult i32 %17, %0
  br i1 %18, label %19, label %24

19:                                               ; preds = %3
  %20 = zext i32 %17 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %4, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = fpext float %22 to double
  br label %24

24:                                               ; preds = %3, %19
  %25 = phi double [ %23, %19 ], [ 0.000000e+00, %3 ]
  %26 = add i32 %17, %10
  %27 = icmp ult i32 %26, %0
  br i1 %27, label %28, label %33

28:                                               ; preds = %24
  %29 = zext i32 %26 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = fpext float %31 to double
  br label %33

33:                                               ; preds = %24, %28
  %34 = phi double [ %32, %28 ], [ 0.000000e+00, %24 ]
  %35 = fadd contract double %25, %34
  %36 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @sdata, i32 0, i32 %14
  store double %35, double addrspace(3)* %36, align 8, !tbaa !11
  br i1 %18, label %37, label %42

37:                                               ; preds = %33
  %38 = zext i32 %17 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %4, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = fpext float %40 to double
  br label %42

42:                                               ; preds = %33, %37
  %43 = phi double [ %41, %37 ], [ 0.000000e+00, %33 ]
  %44 = fsub contract double %35, %43
  br i1 %27, label %45, label %50

45:                                               ; preds = %42
  %46 = zext i32 %26 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %4, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = fpext float %48 to double
  br label %50

50:                                               ; preds = %42, %45
  %51 = phi double [ %49, %45 ], [ 0.000000e+00, %42 ]
  %52 = fsub contract double %44, %51
  %53 = getelementptr inbounds double, double addrspace(3)* %13, i32 %14
  store double %52, double addrspace(3)* %53, align 8, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp ult i16 %9, 2
  br i1 %54, label %57, label %55

55:                                               ; preds = %50
  %56 = getelementptr inbounds double, double addrspace(3)* %12, i32 %14
  br label %59

57:                                               ; preds = %77, %50
  %58 = icmp eq i32 %14, 0
  br i1 %58, label %79, label %84

59:                                               ; preds = %55, %77
  %60 = phi i32 [ %10, %55 ], [ %61, %77 ]
  %61 = lshr i32 %60, 1
  %62 = icmp ult i32 %14, %61
  br i1 %62, label %63, label %77

63:                                               ; preds = %59
  %64 = load double, double addrspace(3)* %36, align 8, !tbaa !11
  %65 = add nuw nsw i32 %61, %14
  %66 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @sdata, i32 0, i32 %65
  %67 = load double, double addrspace(3)* %66, align 8, !tbaa !11
  %68 = fadd contract double %64, %67
  %69 = load double, double addrspace(3)* %53, align 8, !tbaa !11
  %70 = fsub contract double %68, %69
  %71 = getelementptr inbounds double, double addrspace(3)* %13, i32 %65
  %72 = load double, double addrspace(3)* %71, align 8, !tbaa !11
  %73 = fsub contract double %70, %72
  store double %73, double addrspace(3)* %56, align 8, !tbaa !11
  %74 = fsub contract double %73, %64
  %75 = load double, double addrspace(3)* %66, align 8, !tbaa !11
  %76 = fsub contract double %74, %75
  store double %76, double addrspace(3)* %53, align 8, !tbaa !11
  store double %73, double addrspace(3)* %36, align 8, !tbaa !11
  br label %77

77:                                               ; preds = %63, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = icmp ult i32 %60, 4
  br i1 %78, label %57, label %59, !llvm.loop !13

79:                                               ; preds = %57
  %80 = load double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @sdata, i32 0, i32 0), align 8, !tbaa !11
  %81 = fptrunc double %80 to float
  %82 = zext i32 %11 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %5, i64 %82
  store float %81, float addrspace(1)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %79, %57
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
