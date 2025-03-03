; ModuleID = '../data/hip_kernels/15733/5/main.cu'
source_filename = "../data/hip_kernels/15733/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@mask = protected addrspace(4) externally_initialized global [64 x i32] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([64 x i32] addrspace(4)* @mask to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z7conv_1dPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = add nsw i32 %12, -4
  %14 = icmp sgt i32 %12, 3
  %15 = icmp slt i32 %13, %2
  %16 = select i1 %14, i1 %15, i1 false
  br i1 %16, label %17, label %23

17:                                               ; preds = %3
  %18 = zext i32 %13 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !5
  %21 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 0), align 16, !tbaa !7
  %22 = mul nsw i32 %21, %20
  br label %23

23:                                               ; preds = %3, %17
  %24 = phi i32 [ %22, %17 ], [ 0, %3 ]
  %25 = add nsw i32 %12, -3
  %26 = icmp sgt i32 %12, 2
  %27 = icmp slt i32 %25, %2
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %36

29:                                               ; preds = %23
  %30 = zext i32 %25 to i64
  %31 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %30
  %32 = load i32, i32 addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 1), align 4, !tbaa !7
  %34 = mul nsw i32 %33, %32
  %35 = add nsw i32 %34, %24
  br label %36

36:                                               ; preds = %29, %23
  %37 = phi i32 [ %35, %29 ], [ %24, %23 ]
  %38 = add nsw i32 %12, -2
  %39 = icmp sgt i32 %12, 1
  %40 = icmp slt i32 %38, %2
  %41 = select i1 %39, i1 %40, i1 false
  br i1 %41, label %42, label %49

42:                                               ; preds = %36
  %43 = zext i32 %38 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !5
  %46 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 2), align 8, !tbaa !7
  %47 = mul nsw i32 %46, %45
  %48 = add nsw i32 %47, %37
  br label %49

49:                                               ; preds = %42, %36
  %50 = phi i32 [ %48, %42 ], [ %37, %36 ]
  %51 = icmp sgt i32 %12, 0
  %52 = icmp sle i32 %12, %2
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %62

54:                                               ; preds = %49
  %55 = add nsw i32 %12, -1
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 3), align 4, !tbaa !7
  %60 = mul nsw i32 %59, %58
  %61 = add nsw i32 %60, %50
  br label %62

62:                                               ; preds = %54, %49
  %63 = phi i32 [ %61, %54 ], [ %50, %49 ]
  %64 = icmp sgt i32 %12, -1
  %65 = icmp slt i32 %12, %2
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %74

67:                                               ; preds = %62
  %68 = zext i32 %12 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 4), align 16, !tbaa !7
  %72 = mul nsw i32 %71, %70
  %73 = add nsw i32 %72, %63
  br label %74

74:                                               ; preds = %67, %62
  %75 = phi i32 [ %73, %67 ], [ %63, %62 ]
  %76 = add nsw i32 %12, 1
  %77 = icmp sgt i32 %12, -2
  %78 = icmp slt i32 %76, %2
  %79 = select i1 %77, i1 %78, i1 false
  br i1 %79, label %80, label %87

80:                                               ; preds = %74
  %81 = zext i32 %76 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %81
  %83 = load i32, i32 addrspace(1)* %82, align 4, !tbaa !7, !amdgpu.noclobber !5
  %84 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 5), align 4, !tbaa !7
  %85 = mul nsw i32 %84, %83
  %86 = add nsw i32 %85, %75
  br label %87

87:                                               ; preds = %80, %74
  %88 = phi i32 [ %86, %80 ], [ %75, %74 ]
  %89 = add nsw i32 %12, 2
  %90 = icmp sgt i32 %12, -3
  %91 = icmp slt i32 %89, %2
  %92 = select i1 %90, i1 %91, i1 false
  br i1 %92, label %93, label %100

93:                                               ; preds = %87
  %94 = zext i32 %89 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !5
  %97 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 6), align 8, !tbaa !7
  %98 = mul nsw i32 %97, %96
  %99 = add nsw i32 %98, %88
  br label %100

100:                                              ; preds = %93, %87
  %101 = phi i32 [ %99, %93 ], [ %88, %87 ]
  %102 = add nsw i32 %12, 3
  %103 = icmp sgt i32 %12, -4
  %104 = icmp slt i32 %102, %2
  %105 = select i1 %103, i1 %104, i1 false
  br i1 %105, label %106, label %113

106:                                              ; preds = %100
  %107 = zext i32 %102 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !7, !amdgpu.noclobber !5
  %110 = load i32, i32 addrspace(4)* getelementptr inbounds ([64 x i32], [64 x i32] addrspace(4)* @mask, i64 0, i64 7), align 4, !tbaa !7
  %111 = mul nsw i32 %110, %109
  %112 = add nsw i32 %111, %101
  br label %113

113:                                              ; preds = %106, %100
  %114 = phi i32 [ %112, %106 ], [ %101, %100 ]
  %115 = sext i32 %12 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %115
  store i32 %114, i32 addrspace(1)* %116, align 4, !tbaa !7
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
