; ModuleID = '../data/hip_kernels/2006/27/main.cu'
source_filename = "../data/hip_kernels/2006/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @reduceFloatVectorToDoubleScalar(i32 %0, i8 addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = bitcast i8 addrspace(1)* %1 to float addrspace(1)*
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @sdata, i32 0, i32 %9
  %12 = getelementptr inbounds double, double addrspace(3)* %11, i32 %9
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = shl i32 %10, 1
  %15 = mul i32 %14, %9
  %16 = add i32 %15, %13
  %17 = icmp ult i32 %16, %0
  br i1 %17, label %18, label %23

18:                                               ; preds = %3
  %19 = zext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %4, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = fpext float %21 to double
  br label %23

23:                                               ; preds = %3, %18
  %24 = phi double [ %22, %18 ], [ 0.000000e+00, %3 ]
  %25 = add i32 %16, %9
  %26 = icmp ult i32 %25, %0
  br i1 %26, label %27, label %32

27:                                               ; preds = %23
  %28 = zext i32 %25 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %4, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !5
  %31 = fpext float %30 to double
  br label %32

32:                                               ; preds = %23, %27
  %33 = phi double [ %31, %27 ], [ 0.000000e+00, %23 ]
  %34 = fadd contract double %24, %33
  %35 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @sdata, i32 0, i32 %13
  store double %34, double addrspace(3)* %35, align 8, !tbaa !11
  br i1 %17, label %36, label %41

36:                                               ; preds = %32
  %37 = zext i32 %16 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %4, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !7, !amdgpu.noclobber !5
  %40 = fpext float %39 to double
  br label %41

41:                                               ; preds = %32, %36
  %42 = phi double [ %40, %36 ], [ 0.000000e+00, %32 ]
  %43 = fsub contract double %34, %42
  br i1 %26, label %44, label %49

44:                                               ; preds = %41
  %45 = zext i32 %25 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %4, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fpext float %47 to double
  br label %49

49:                                               ; preds = %41, %44
  %50 = phi double [ %48, %44 ], [ 0.000000e+00, %41 ]
  %51 = fsub contract double %43, %50
  %52 = getelementptr inbounds double, double addrspace(3)* %12, i32 %13
  store double %51, double addrspace(3)* %52, align 8, !tbaa !11
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %53 = icmp ult i16 %8, 2
  br i1 %53, label %56, label %54

54:                                               ; preds = %49
  %55 = getelementptr inbounds double, double addrspace(3)* %11, i32 %13
  br label %58

56:                                               ; preds = %76, %49
  %57 = icmp eq i32 %13, 0
  br i1 %57, label %78, label %82

58:                                               ; preds = %54, %76
  %59 = phi i32 [ %9, %54 ], [ %60, %76 ]
  %60 = lshr i32 %59, 1
  %61 = icmp ult i32 %13, %60
  br i1 %61, label %62, label %76

62:                                               ; preds = %58
  %63 = load double, double addrspace(3)* %35, align 8, !tbaa !11
  %64 = add nuw nsw i32 %60, %13
  %65 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @sdata, i32 0, i32 %64
  %66 = load double, double addrspace(3)* %65, align 8, !tbaa !11
  %67 = fadd contract double %63, %66
  %68 = load double, double addrspace(3)* %52, align 8, !tbaa !11
  %69 = fsub contract double %67, %68
  %70 = getelementptr inbounds double, double addrspace(3)* %12, i32 %64
  %71 = load double, double addrspace(3)* %70, align 8, !tbaa !11
  %72 = fsub contract double %69, %71
  store double %72, double addrspace(3)* %55, align 8, !tbaa !11
  %73 = fsub contract double %72, %63
  %74 = load double, double addrspace(3)* %65, align 8, !tbaa !11
  %75 = fsub contract double %73, %74
  store double %75, double addrspace(3)* %52, align 8, !tbaa !11
  store double %72, double addrspace(3)* %35, align 8, !tbaa !11
  br label %76

76:                                               ; preds = %62, %58
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = icmp ult i32 %59, 4
  br i1 %77, label %56, label %58, !llvm.loop !13

78:                                               ; preds = %56
  %79 = load double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @sdata, i32 0, i32 0), align 8, !tbaa !11
  %80 = zext i32 %10 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %2, i64 %80
  store double %79, double addrspace(1)* %81, align 8, !tbaa !11
  br label %82

82:                                               ; preds = %78, %56
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
