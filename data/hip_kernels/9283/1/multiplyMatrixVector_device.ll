; ModuleID = '../data/hip_kernels/9283/1/main.cu'
source_filename = "../data/hip_kernels/9283/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20multiplyMatrixVectorPiS_S_i(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = mul i32 %5, %3
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = mul i32 %9, %3
  %11 = add i32 %10, %7
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %12
  %14 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !5, !amdgpu.noclobber !9
  %15 = sext i32 %8 to i64
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %15
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !5, !amdgpu.noclobber !9
  %18 = mul nsw i32 %17, %14
  %19 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %7
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp eq i32 %7, 0
  br i1 %20, label %21, label %89

21:                                               ; preds = %4
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 4, !range !10, !invariant.load !9
  %26 = zext i16 %25 to i32
  %27 = and i32 %26, 7
  %28 = icmp ult i16 %25, 8
  br i1 %28, label %31, label %29

29:                                               ; preds = %21
  %30 = and i32 %26, 2040
  br label %51

31:                                               ; preds = %51, %21
  %32 = phi i32 [ undef, %21 ], [ %85, %51 ]
  %33 = phi i32 [ 0, %21 ], [ %86, %51 ]
  %34 = phi i32 [ 0, %21 ], [ %85, %51 ]
  %35 = icmp eq i32 %27, 0
  br i1 %35, label %46, label %36

36:                                               ; preds = %31, %36
  %37 = phi i32 [ %43, %36 ], [ %33, %31 ]
  %38 = phi i32 [ %42, %36 ], [ %34, %31 ]
  %39 = phi i32 [ %44, %36 ], [ 0, %31 ]
  %40 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %37
  %41 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %42 = add nsw i32 %41, %38
  %43 = add nuw nsw i32 %37, 1
  %44 = add i32 %39, 1
  %45 = icmp eq i32 %44, %27
  br i1 %45, label %46, label %36, !llvm.loop !11

46:                                               ; preds = %36, %31
  %47 = phi i32 [ %32, %31 ], [ %42, %36 ]
  %48 = add i32 %6, %9
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  store i32 %47, i32 addrspace(1)* %50, align 4, !tbaa !5
  br label %89

51:                                               ; preds = %51, %29
  %52 = phi i32 [ 0, %29 ], [ %86, %51 ]
  %53 = phi i32 [ 0, %29 ], [ %85, %51 ]
  %54 = phi i32 [ 0, %29 ], [ %87, %51 ]
  %55 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %52
  %56 = load i32, i32 addrspace(3)* %55, align 16, !tbaa !5
  %57 = add nsw i32 %56, %53
  %58 = or i32 %52, 1
  %59 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %58
  %60 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !5
  %61 = add nsw i32 %60, %57
  %62 = or i32 %52, 2
  %63 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %62
  %64 = load i32, i32 addrspace(3)* %63, align 8, !tbaa !5
  %65 = add nsw i32 %64, %61
  %66 = or i32 %52, 3
  %67 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %66
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %69 = add nsw i32 %68, %65
  %70 = or i32 %52, 4
  %71 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %70
  %72 = load i32, i32 addrspace(3)* %71, align 16, !tbaa !5
  %73 = add nsw i32 %72, %69
  %74 = or i32 %52, 5
  %75 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %74
  %76 = load i32, i32 addrspace(3)* %75, align 4, !tbaa !5
  %77 = add nsw i32 %76, %73
  %78 = or i32 %52, 6
  %79 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %78
  %80 = load i32, i32 addrspace(3)* %79, align 8, !tbaa !5
  %81 = add nsw i32 %80, %77
  %82 = or i32 %52, 7
  %83 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ20multiplyMatrixVectorPiS_S_iE12reduce_array, i32 0, i32 %82
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !5
  %85 = add nsw i32 %84, %81
  %86 = add nuw nsw i32 %52, 8
  %87 = add i32 %54, 8
  %88 = icmp eq i32 %87, %30
  br i1 %88, label %31, label %51, !llvm.loop !13

89:                                               ; preds = %46, %4
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{i16 1, i16 1025}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
