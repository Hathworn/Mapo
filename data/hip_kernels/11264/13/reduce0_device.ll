; ModuleID = '../data/hip_kernels/11264/13/main.cu'
source_filename = "../data/hip_kernels/11264/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sdata = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7reduce0PfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 1
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = add i32 %13, %10
  %15 = icmp ult i32 %14, %2
  br i1 %15, label %16, label %24

16:                                               ; preds = %3
  %17 = sext i32 %13 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = zext i32 %14 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = fadd contract float %19, %22
  br label %30

24:                                               ; preds = %3
  %25 = icmp slt i32 %13, %2
  br i1 %25, label %26, label %30

26:                                               ; preds = %24
  %27 = sext i32 %13 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %30

30:                                               ; preds = %24, %26, %16
  %31 = phi float [ %29, %26 ], [ %23, %16 ], [ 0.000000e+00, %24 ]
  %32 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  store float %31, float addrspace(3)* %32, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %33 = icmp ugt i16 %9, 65
  br i1 %33, label %34, label %36

34:                                               ; preds = %30
  %35 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  br label %38

36:                                               ; preds = %48, %30
  %37 = icmp ult i32 %4, 32
  br i1 %37, label %50, label %77

38:                                               ; preds = %34, %48
  %39 = phi i32 [ %10, %34 ], [ %40, %48 ]
  %40 = lshr i32 %39, 1
  %41 = icmp ult i32 %4, %40
  br i1 %41, label %42, label %48

42:                                               ; preds = %38
  %43 = add nuw nsw i32 %40, %4
  %44 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %43
  %45 = load float, float addrspace(3)* %44, align 4, !tbaa !7
  %46 = load float, float addrspace(3)* %35, align 4, !tbaa !7
  %47 = fadd contract float %45, %46
  store float %47, float addrspace(3)* %35, align 4, !tbaa !7
  br label %48

48:                                               ; preds = %42, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = icmp ugt i32 %39, 131
  br i1 %49, label %38, label %36, !llvm.loop !11

50:                                               ; preds = %36
  %51 = add nuw nsw i32 %4, 32
  %52 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %51
  %53 = load float, float addrspace(3)* %52, align 4, !tbaa !7
  %54 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %4
  %55 = load float, float addrspace(3)* %54, align 4, !tbaa !7
  %56 = fadd contract float %53, %55
  %57 = add nuw nsw i32 %4, 16
  %58 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %57
  %59 = load float, float addrspace(3)* %58, align 4, !tbaa !7
  %60 = fadd contract float %56, %59
  %61 = add nuw nsw i32 %4, 8
  %62 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %61
  %63 = load float, float addrspace(3)* %62, align 4, !tbaa !7
  %64 = fadd contract float %60, %63
  %65 = add nuw nsw i32 %4, 4
  %66 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %65
  %67 = load float, float addrspace(3)* %66, align 4, !tbaa !7
  %68 = fadd contract float %64, %67
  %69 = add nuw nsw i32 %4, 2
  %70 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %69
  %71 = load float, float addrspace(3)* %70, align 4, !tbaa !7
  %72 = fadd contract float %68, %71
  %73 = add nuw nsw i32 %4, 1
  %74 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !7
  %76 = fadd contract float %72, %75
  store float %76, float addrspace(3)* %54, align 4, !tbaa !7
  br label %77

77:                                               ; preds = %50, %36
  %78 = icmp eq i32 %4, 0
  br i1 %78, label %79, label %83

79:                                               ; preds = %77
  %80 = load float, float addrspace(3)* getelementptr inbounds ([0 x float], [0 x float] addrspace(3)* @sdata, i32 0, i32 0), align 4, !tbaa !7
  %81 = zext i32 %5 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %1, i64 %81
  store float %80, float addrspace(1)* %82, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %79, %77
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
