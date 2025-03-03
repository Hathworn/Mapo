; ModuleID = '../data/hip_kernels/4149/3/main.cu'
source_filename = "../data/hip_kernels/4149/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16gpu_rndrd_kernelPimmm(i32 addrspace(1)* nocapture %0, i64 %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = icmp eq i64 %1, 0
  br i1 %5, label %81, label %6

6:                                                ; preds = %4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = icmp uge i64 %16, %3
  %18 = lshr i64 %16, 5
  %19 = add nuw nsw i64 %18, 24819
  %20 = icmp eq i64 %2, 0
  %21 = select i1 %17, i1 true, i1 %20
  br label %22

22:                                               ; preds = %76, %6
  %23 = phi i32 [ 0, %6 ], [ %77, %76 ]
  %24 = phi i64 [ 0, %6 ], [ %78, %76 ]
  br i1 %21, label %76, label %25

25:                                               ; preds = %22, %25
  %26 = phi i32 [ %73, %25 ], [ %23, %22 ]
  %27 = phi i64 [ %47, %25 ], [ %16, %22 ]
  %28 = phi i64 [ %49, %25 ], [ %19, %22 ]
  %29 = phi i64 [ %74, %25 ], [ 0, %22 ]
  %30 = shl i64 %28, 5
  %31 = add i64 %27, %30
  %32 = urem i64 %31, %3
  %33 = add i64 %28, 548191
  %34 = urem i64 %33, %3
  %35 = shl i64 %34, 5
  %36 = add i64 %35, %32
  %37 = urem i64 %36, %3
  %38 = add i64 %34, 548191
  %39 = urem i64 %38, %3
  %40 = shl i64 %39, 5
  %41 = add i64 %40, %37
  %42 = urem i64 %41, %3
  %43 = add i64 %39, 548191
  %44 = urem i64 %43, %3
  %45 = shl i64 %44, 5
  %46 = add i64 %45, %42
  %47 = urem i64 %46, %3
  %48 = add i64 %44, 548191
  %49 = urem i64 %48, %3
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !5
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = sext i32 %51 to i64
  %59 = icmp ne i64 %32, %58
  %60 = zext i1 %59 to i32
  %61 = add nsw i32 %26, %60
  %62 = sext i32 %53 to i64
  %63 = icmp ne i64 %37, %62
  %64 = zext i1 %63 to i32
  %65 = add nsw i32 %61, %64
  %66 = sext i32 %55 to i64
  %67 = icmp ne i64 %42, %66
  %68 = zext i1 %67 to i32
  %69 = add nsw i32 %65, %68
  %70 = sext i32 %57 to i64
  %71 = icmp ne i64 %47, %70
  %72 = zext i1 %71 to i32
  %73 = add nsw i32 %69, %72
  %74 = add nuw i64 %29, 4
  %75 = icmp ult i64 %74, %2
  br i1 %75, label %25, label %76, !llvm.loop !11

76:                                               ; preds = %25, %22
  %77 = phi i32 [ %23, %22 ], [ %73, %25 ]
  %78 = add nuw i64 %24, 1
  %79 = icmp uge i64 %78, %1
  %80 = select i1 %17, i1 true, i1 %79
  br i1 %80, label %81, label %22, !llvm.loop !13

81:                                               ; preds = %76, %4
  %82 = phi i32 [ 0, %4 ], [ %77, %76 ]
  %83 = icmp sgt i32 %82, 0
  %84 = icmp ugt i64 %1, %3
  %85 = select i1 %83, i1 %84, i1 false
  br i1 %85, label %86, label %87

86:                                               ; preds = %81
  store i32 %82, i32 addrspace(1)* %0, align 4, !tbaa !7
  br label %87

87:                                               ; preds = %86, %81
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
