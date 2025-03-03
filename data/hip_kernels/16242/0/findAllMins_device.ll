; ModuleID = '../data/hip_kernels/16242/0/main.cu'
source_filename = "../data/hip_kernels/16242/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11findAllMinsPiS_m(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = trunc i64 %2 to i32
  %15 = mul i32 %12, %14
  %16 = icmp ult i64 %13, %2
  br i1 %16, label %17, label %123

17:                                               ; preds = %3
  %18 = and i64 %2, 7
  %19 = icmp ult i64 %2, 8
  br i1 %19, label %22, label %20

20:                                               ; preds = %17
  %21 = and i64 %2, -8
  br label %45

22:                                               ; preds = %45, %17
  %23 = phi i32 [ undef, %17 ], [ %119, %45 ]
  %24 = phi i32 [ 0, %17 ], [ %120, %45 ]
  %25 = phi i32 [ 2147483647, %17 ], [ %119, %45 ]
  %26 = icmp eq i64 %18, 0
  br i1 %26, label %42, label %27

27:                                               ; preds = %22, %27
  %28 = phi i32 [ %39, %27 ], [ %24, %22 ]
  %29 = phi i32 [ %38, %27 ], [ %25, %22 ]
  %30 = phi i64 [ %40, %27 ], [ 0, %22 ]
  %31 = add nsw i32 %28, %15
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !5
  %35 = icmp slt i32 %34, %29
  %36 = icmp sgt i32 %34, 0
  %37 = and i1 %35, %36
  %38 = select i1 %37, i32 %34, i32 %29
  %39 = add nuw nsw i32 %28, 1
  %40 = add i64 %30, 1
  %41 = icmp eq i64 %40, %18
  br i1 %41, label %42, label %27, !llvm.loop !11

42:                                               ; preds = %27, %22
  %43 = phi i32 [ %23, %22 ], [ %38, %27 ]
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %13
  store i32 %43, i32 addrspace(1)* %44, align 4, !tbaa !7
  br label %123

45:                                               ; preds = %45, %20
  %46 = phi i32 [ 0, %20 ], [ %120, %45 ]
  %47 = phi i32 [ 2147483647, %20 ], [ %119, %45 ]
  %48 = phi i64 [ 0, %20 ], [ %121, %45 ]
  %49 = add nsw i32 %46, %15
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = icmp slt i32 %52, %47
  %54 = icmp sgt i32 %52, 0
  %55 = and i1 %53, %54
  %56 = select i1 %55, i32 %52, i32 %47
  %57 = or i32 %46, 1
  %58 = add nsw i32 %57, %15
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7, !amdgpu.noclobber !5
  %62 = icmp slt i32 %61, %56
  %63 = icmp sgt i32 %61, 0
  %64 = and i1 %62, %63
  %65 = select i1 %64, i32 %61, i32 %56
  %66 = or i32 %46, 2
  %67 = add nsw i32 %66, %15
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = icmp slt i32 %70, %65
  %72 = icmp sgt i32 %70, 0
  %73 = and i1 %71, %72
  %74 = select i1 %73, i32 %70, i32 %65
  %75 = or i32 %46, 3
  %76 = add nsw i32 %75, %15
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7, !amdgpu.noclobber !5
  %80 = icmp slt i32 %79, %74
  %81 = icmp sgt i32 %79, 0
  %82 = and i1 %80, %81
  %83 = select i1 %82, i32 %79, i32 %74
  %84 = or i32 %46, 4
  %85 = add nsw i32 %84, %15
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = icmp slt i32 %88, %83
  %90 = icmp sgt i32 %88, 0
  %91 = and i1 %89, %90
  %92 = select i1 %91, i32 %88, i32 %83
  %93 = or i32 %46, 5
  %94 = add nsw i32 %93, %15
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = icmp slt i32 %97, %92
  %99 = icmp sgt i32 %97, 0
  %100 = and i1 %98, %99
  %101 = select i1 %100, i32 %97, i32 %92
  %102 = or i32 %46, 6
  %103 = add nsw i32 %102, %15
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = icmp slt i32 %106, %101
  %108 = icmp sgt i32 %106, 0
  %109 = and i1 %107, %108
  %110 = select i1 %109, i32 %106, i32 %101
  %111 = or i32 %46, 7
  %112 = add nsw i32 %111, %15
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !7, !amdgpu.noclobber !5
  %116 = icmp slt i32 %115, %110
  %117 = icmp sgt i32 %115, 0
  %118 = and i1 %116, %117
  %119 = select i1 %118, i32 %115, i32 %110
  %120 = add nuw nsw i32 %46, 8
  %121 = add i64 %48, 8
  %122 = icmp eq i64 %121, %21
  br i1 %122, label %22, label %45, !llvm.loop !13

123:                                              ; preds = %42, %3
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
