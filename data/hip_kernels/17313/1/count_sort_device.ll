; ModuleID = '../data/hip_kernels/17313/1/main.cu'
source_filename = "../data/hip_kernels/17313/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10count_sortPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %146

14:                                               ; preds = %3
  %15 = icmp sgt i32 %2, 0
  %16 = sext i32 %12 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7
  br i1 %15, label %19, label %49

19:                                               ; preds = %14
  %20 = and i32 %2, 7
  %21 = icmp ult i32 %2, 8
  br i1 %21, label %24, label %22

22:                                               ; preds = %19
  %23 = and i32 %2, -8
  br label %52

24:                                               ; preds = %52, %19
  %25 = phi i32 [ undef, %19 ], [ %142, %52 ]
  %26 = phi i32 [ 0, %19 ], [ %143, %52 ]
  %27 = phi i32 [ 0, %19 ], [ %142, %52 ]
  %28 = icmp eq i32 %20, 0
  br i1 %28, label %46, label %29

29:                                               ; preds = %24, %29
  %30 = phi i32 [ %43, %29 ], [ %26, %24 ]
  %31 = phi i32 [ %42, %29 ], [ %27, %24 ]
  %32 = phi i32 [ %44, %29 ], [ 0, %24 ]
  %33 = zext i32 %30 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = icmp slt i32 %35, %18
  %37 = icmp eq i32 %35, %18
  %38 = icmp slt i32 %30, %12
  %39 = select i1 %37, i1 %38, i1 false
  %40 = select i1 %36, i1 true, i1 %39
  %41 = zext i1 %40 to i32
  %42 = add nuw nsw i32 %31, %41
  %43 = add nuw nsw i32 %30, 1
  %44 = add i32 %32, 1
  %45 = icmp eq i32 %44, %20
  br i1 %45, label %46, label %29, !llvm.loop !11

46:                                               ; preds = %29, %24
  %47 = phi i32 [ %25, %24 ], [ %42, %29 ]
  %48 = zext i32 %47 to i64
  br label %49

49:                                               ; preds = %46, %14
  %50 = phi i64 [ 0, %14 ], [ %48, %46 ]
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  store i32 %18, i32 addrspace(1)* %51, align 4, !tbaa !7
  br label %146

52:                                               ; preds = %52, %22
  %53 = phi i32 [ 0, %22 ], [ %143, %52 ]
  %54 = phi i32 [ 0, %22 ], [ %142, %52 ]
  %55 = phi i32 [ 0, %22 ], [ %144, %52 ]
  %56 = zext i32 %53 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = icmp slt i32 %58, %18
  %60 = icmp eq i32 %58, %18
  %61 = icmp slt i32 %53, %12
  %62 = select i1 %60, i1 %61, i1 false
  %63 = select i1 %59, i1 true, i1 %62
  %64 = zext i1 %63 to i32
  %65 = add nuw nsw i32 %54, %64
  %66 = or i32 %53, 1
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = icmp slt i32 %69, %18
  %71 = icmp eq i32 %69, %18
  %72 = icmp slt i32 %66, %12
  %73 = select i1 %71, i1 %72, i1 false
  %74 = select i1 %70, i1 true, i1 %73
  %75 = zext i1 %74 to i32
  %76 = add nuw nsw i32 %65, %75
  %77 = or i32 %53, 2
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %78
  %80 = load i32, i32 addrspace(1)* %79, align 4, !tbaa !7, !amdgpu.noclobber !5
  %81 = icmp slt i32 %80, %18
  %82 = icmp eq i32 %80, %18
  %83 = icmp slt i32 %77, %12
  %84 = select i1 %82, i1 %83, i1 false
  %85 = select i1 %81, i1 true, i1 %84
  %86 = zext i1 %85 to i32
  %87 = add nuw nsw i32 %76, %86
  %88 = or i32 %53, 3
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !7, !amdgpu.noclobber !5
  %92 = icmp slt i32 %91, %18
  %93 = icmp eq i32 %91, %18
  %94 = icmp slt i32 %88, %12
  %95 = select i1 %93, i1 %94, i1 false
  %96 = select i1 %92, i1 true, i1 %95
  %97 = zext i1 %96 to i32
  %98 = add nuw nsw i32 %87, %97
  %99 = or i32 %53, 4
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %100
  %102 = load i32, i32 addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = icmp slt i32 %102, %18
  %104 = icmp eq i32 %102, %18
  %105 = icmp slt i32 %99, %12
  %106 = select i1 %104, i1 %105, i1 false
  %107 = select i1 %103, i1 true, i1 %106
  %108 = zext i1 %107 to i32
  %109 = add nuw nsw i32 %98, %108
  %110 = or i32 %53, 5
  %111 = zext i32 %110 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %111
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = icmp slt i32 %113, %18
  %115 = icmp eq i32 %113, %18
  %116 = icmp slt i32 %110, %12
  %117 = select i1 %115, i1 %116, i1 false
  %118 = select i1 %114, i1 true, i1 %117
  %119 = zext i1 %118 to i32
  %120 = add nuw nsw i32 %109, %119
  %121 = or i32 %53, 6
  %122 = zext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = icmp slt i32 %124, %18
  %126 = icmp eq i32 %124, %18
  %127 = icmp slt i32 %121, %12
  %128 = select i1 %126, i1 %127, i1 false
  %129 = select i1 %125, i1 true, i1 %128
  %130 = zext i1 %129 to i32
  %131 = add nuw nsw i32 %120, %130
  %132 = or i32 %53, 7
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %133
  %135 = load i32, i32 addrspace(1)* %134, align 4, !tbaa !7, !amdgpu.noclobber !5
  %136 = icmp slt i32 %135, %18
  %137 = icmp eq i32 %135, %18
  %138 = icmp slt i32 %132, %12
  %139 = select i1 %137, i1 %138, i1 false
  %140 = select i1 %136, i1 true, i1 %139
  %141 = zext i1 %140 to i32
  %142 = add nuw nsw i32 %131, %141
  %143 = add nuw nsw i32 %53, 8
  %144 = add i32 %55, 8
  %145 = icmp eq i32 %144, %23
  br i1 %145, label %24, label %52, !llvm.loop !13

146:                                              ; preds = %49, %3
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
