; ModuleID = '../data/hip_kernels/14448/1/main.cu'
source_filename = "../data/hip_kernels/14448/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11smoothColorPhS_jj(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = shl i32 %5, 16
  %13 = mul i32 %12, %10
  %14 = shl i32 %11, 10
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = or i32 %15, %16
  %18 = mul i32 %3, %2
  %19 = icmp ult i32 %17, %18
  br i1 %19, label %20, label %103

20:                                               ; preds = %4
  %21 = freeze i32 %17
  %22 = freeze i32 %2
  %23 = udiv i32 %21, %22
  %24 = add i32 %23, -2
  %25 = add i32 %23, 2
  %26 = mul i32 %23, %22
  %27 = sub i32 %21, %26
  %28 = add i32 %27, -2
  %29 = add i32 %27, 2
  %30 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %31 = tail call i32 @llvm.smax.i32(i32 %28, i32 0)
  %32 = icmp ult i32 %25, %2
  %33 = add i32 %2, -1
  %34 = select i1 %32, i32 %25, i32 %33
  %35 = icmp ult i32 %29, %2
  %36 = select i1 %35, i32 %29, i32 %33
  %37 = icmp sgt i32 %30, %34
  br i1 %37, label %48, label %38

38:                                               ; preds = %20
  %39 = icmp sgt i32 %31, %36
  br label %40

40:                                               ; preds = %38, %68
  %41 = phi i32 [ %30, %38 ], [ %73, %68 ]
  %42 = phi i32 [ 0, %38 ], [ %72, %68 ]
  %43 = phi i32 [ 0, %38 ], [ %71, %68 ]
  %44 = phi i32 [ 0, %38 ], [ %70, %68 ]
  %45 = phi i32 [ 0, %38 ], [ %69, %68 ]
  br i1 %39, label %68, label %46

46:                                               ; preds = %40
  %47 = mul i32 %41, %2
  br label %75

48:                                               ; preds = %68, %20
  %49 = phi i32 [ 0, %20 ], [ %69, %68 ]
  %50 = phi i32 [ 0, %20 ], [ %70, %68 ]
  %51 = phi i32 [ 0, %20 ], [ %71, %68 ]
  %52 = phi i32 [ 0, %20 ], [ %72, %68 ]
  %53 = sdiv i32 %49, %52
  %54 = trunc i32 %53 to i8
  %55 = mul i32 %17, 3
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %56
  store i8 %54, i8 addrspace(1)* %57, align 1, !tbaa !7
  %58 = sdiv i32 %50, %52
  %59 = trunc i32 %58 to i8
  %60 = add i32 %55, 1
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %61
  store i8 %59, i8 addrspace(1)* %62, align 1, !tbaa !7
  %63 = sdiv i32 %51, %52
  %64 = trunc i32 %63 to i8
  %65 = add i32 %55, 2
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %66
  store i8 %64, i8 addrspace(1)* %67, align 1, !tbaa !7
  br label %103

68:                                               ; preds = %75, %40
  %69 = phi i32 [ %45, %40 ], [ %87, %75 ]
  %70 = phi i32 [ %44, %40 ], [ %93, %75 ]
  %71 = phi i32 [ %43, %40 ], [ %99, %75 ]
  %72 = phi i32 [ %42, %40 ], [ %100, %75 ]
  %73 = add nuw nsw i32 %41, 1
  %74 = icmp slt i32 %41, %34
  br i1 %74, label %40, label %48, !llvm.loop !10

75:                                               ; preds = %46, %75
  %76 = phi i32 [ %31, %46 ], [ %101, %75 ]
  %77 = phi i32 [ %42, %46 ], [ %100, %75 ]
  %78 = phi i32 [ %43, %46 ], [ %99, %75 ]
  %79 = phi i32 [ %44, %46 ], [ %93, %75 ]
  %80 = phi i32 [ %45, %46 ], [ %87, %75 ]
  %81 = add i32 %76, %47
  %82 = mul i32 %81, 3
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %83
  %85 = load i8, i8 addrspace(1)* %84, align 1, !tbaa !7, !amdgpu.noclobber !5
  %86 = zext i8 %85 to i32
  %87 = add nsw i32 %80, %86
  %88 = add i32 %82, 1
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %89
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !7, !amdgpu.noclobber !5
  %92 = zext i8 %91 to i32
  %93 = add nsw i32 %79, %92
  %94 = add i32 %82, 2
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !7, !amdgpu.noclobber !5
  %98 = zext i8 %97 to i32
  %99 = add nsw i32 %78, %98
  %100 = add nsw i32 %77, 1
  %101 = add nuw nsw i32 %76, 1
  %102 = icmp slt i32 %76, %36
  br i1 %102, label %75, label %68, !llvm.loop !12

103:                                              ; preds = %4, %48
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
