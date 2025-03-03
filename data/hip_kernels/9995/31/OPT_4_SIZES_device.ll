; ModuleID = '../data/hip_kernels/9995/31/main.cu'
source_filename = "../data/hip_kernels/9995/31/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11OPT_4_SIZESPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %80

15:                                               ; preds = %4
  %16 = icmp sgt i32 %13, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %15
  %18 = add nsw i32 %13, -1
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %19
  %21 = load i32, i32 addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %22

22:                                               ; preds = %17, %15
  %23 = phi i32 [ %21, %17 ], [ 0, %15 ]
  %24 = sext i32 %13 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %27 = icmp sgt i32 %3, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %22
  %29 = icmp slt i32 %23, %26
  br label %33

30:                                               ; preds = %76, %22
  %31 = phi i32 [ 0, %22 ], [ %77, %76 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %24
  store i32 %31, i32 addrspace(1)* %32, align 4, !tbaa !7
  br label %80

33:                                               ; preds = %28, %76
  %34 = phi i32 [ 0, %28 ], [ %78, %76 ]
  %35 = phi i32 [ 0, %28 ], [ %77, %76 ]
  %36 = icmp eq i32 %13, %34
  br i1 %36, label %76, label %37

37:                                               ; preds = %33
  %38 = icmp eq i32 %34, 0
  br i1 %38, label %44, label %39

39:                                               ; preds = %37
  %40 = add nsw i32 %34, -1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %44

44:                                               ; preds = %39, %37
  %45 = phi i32 [ %43, %39 ], [ 0, %37 ]
  %46 = zext i32 %34 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !6
  %49 = icmp slt i32 %45, %48
  %50 = select i1 %29, i1 %49, i1 false
  br i1 %50, label %51, label %73

51:                                               ; preds = %44, %67
  %52 = phi i32 [ %69, %67 ], [ %45, %44 ]
  %53 = phi i32 [ %68, %67 ], [ %23, %44 ]
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !6
  %57 = sext i32 %52 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = icmp slt i32 %56, %59
  br i1 %60, label %61, label %63

61:                                               ; preds = %51
  %62 = add nsw i32 %53, 1
  br label %67

63:                                               ; preds = %51
  %64 = icmp slt i32 %59, %56
  br i1 %64, label %65, label %73

65:                                               ; preds = %63
  %66 = add nsw i32 %52, 1
  br label %67

67:                                               ; preds = %65, %61
  %68 = phi i32 [ %62, %61 ], [ %53, %65 ]
  %69 = phi i32 [ %52, %61 ], [ %66, %65 ]
  %70 = icmp slt i32 %68, %26
  %71 = icmp slt i32 %69, %48
  %72 = select i1 %70, i1 %71, i1 false
  br i1 %72, label %51, label %73, !llvm.loop !11

73:                                               ; preds = %67, %63, %44
  %74 = phi i32 [ 0, %44 ], [ 0, %67 ], [ 1, %63 ]
  %75 = add nsw i32 %35, %74
  br label %76

76:                                               ; preds = %33, %73
  %77 = phi i32 [ %35, %33 ], [ %75, %73 ]
  %78 = add nuw nsw i32 %34, 1
  %79 = icmp eq i32 %78, %3
  br i1 %79, label %30, label %33, !llvm.loop !13

80:                                               ; preds = %30, %4
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
