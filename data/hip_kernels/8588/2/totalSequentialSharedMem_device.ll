; ModuleID = '../data/hip_kernels/8588/2/main.cu'
source_filename = "../data/hip_kernels/8588/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ24totalSequentialSharedMemPfS_iE5sdata = internal unnamed_addr addrspace(3) global [1024 x float] undef, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z24totalSequentialSharedMemPfS_i(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add nsw i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %18

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %0, i64 %15
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %18

18:                                               ; preds = %3, %14
  %19 = phi float [ %17, %14 ], [ 0.000000e+00, %3 ]
  %20 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %4
  store float %19, float addrspace(3)* %20, align 4, !tbaa !7
  %21 = icmp eq i32 %4, 0
  br i1 %21, label %22, label %91

22:                                               ; preds = %18
  %23 = load float, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 0), align 16, !tbaa !7
  %24 = icmp ugt i16 %9, 1
  br i1 %24, label %25, label %49

25:                                               ; preds = %22
  %26 = add nsw i32 %10, -1
  %27 = add nsw i32 %10, -2
  %28 = and i32 %26, 7
  %29 = icmp ult i32 %27, 7
  br i1 %29, label %32, label %30

30:                                               ; preds = %25
  %31 = and i32 %26, -8
  br label %53

32:                                               ; preds = %53, %25
  %33 = phi float [ undef, %25 ], [ %87, %53 ]
  %34 = phi i32 [ 1, %25 ], [ %88, %53 ]
  %35 = phi float [ %23, %25 ], [ %87, %53 ]
  %36 = icmp eq i32 %28, 0
  br i1 %36, label %47, label %37

37:                                               ; preds = %32, %37
  %38 = phi i32 [ %44, %37 ], [ %34, %32 ]
  %39 = phi float [ %43, %37 ], [ %35, %32 ]
  %40 = phi i32 [ %45, %37 ], [ 0, %32 ]
  %41 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %38
  %42 = load float, float addrspace(3)* %41, align 4, !tbaa !7
  %43 = fadd contract float %42, %39
  %44 = add nuw nsw i32 %38, 1
  %45 = add i32 %40, 1
  %46 = icmp eq i32 %45, %28
  br i1 %46, label %47, label %37, !llvm.loop !11

47:                                               ; preds = %37, %32
  %48 = phi float [ %33, %32 ], [ %43, %37 ]
  store float %48, float addrspace(3)* getelementptr inbounds ([1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 0), align 16, !tbaa !7
  br label %49

49:                                               ; preds = %47, %22
  %50 = phi float [ %48, %47 ], [ %23, %22 ]
  %51 = zext i32 %5 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  store float %50, float addrspace(1)* %52, align 4, !tbaa !7
  br label %91

53:                                               ; preds = %53, %30
  %54 = phi i32 [ 1, %30 ], [ %88, %53 ]
  %55 = phi float [ %23, %30 ], [ %87, %53 ]
  %56 = phi i32 [ 0, %30 ], [ %89, %53 ]
  %57 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %54
  %58 = load float, float addrspace(3)* %57, align 4, !tbaa !7
  %59 = fadd contract float %58, %55
  %60 = add nuw nsw i32 %54, 1
  %61 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %60
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !7
  %63 = fadd contract float %62, %59
  %64 = add nuw nsw i32 %54, 2
  %65 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !7
  %67 = fadd contract float %66, %63
  %68 = add nuw nsw i32 %54, 3
  %69 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %71 = fadd contract float %70, %67
  %72 = add nuw nsw i32 %54, 4
  %73 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %75 = fadd contract float %74, %71
  %76 = add nuw nsw i32 %54, 5
  %77 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %76
  %78 = load float, float addrspace(3)* %77, align 4, !tbaa !7
  %79 = fadd contract float %78, %75
  %80 = add nuw nsw i32 %54, 6
  %81 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %80
  %82 = load float, float addrspace(3)* %81, align 4, !tbaa !7
  %83 = fadd contract float %82, %79
  %84 = add nuw nsw i32 %54, 7
  %85 = getelementptr inbounds [1024 x float], [1024 x float] addrspace(3)* @_ZZ24totalSequentialSharedMemPfS_iE5sdata, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !7
  %87 = fadd contract float %86, %83
  %88 = add nuw nsw i32 %54, 8
  %89 = add i32 %56, 8
  %90 = icmp eq i32 %89, %31
  br i1 %90, label %32, label %53, !llvm.loop !13

91:                                               ; preds = %49, %18
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
