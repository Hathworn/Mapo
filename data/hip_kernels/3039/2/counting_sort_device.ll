; ModuleID = '../data/hip_kernels/3039/2/main.cu'
source_filename = "../data/hip_kernels/3039/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z13counting_sortPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %146

14:                                               ; preds = %3
  %15 = icmp sgt i32 %2, 0
  %16 = sext i32 %12 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7
  br i1 %15, label %19, label %143

19:                                               ; preds = %14
  %20 = and i32 %2, 7
  %21 = icmp ult i32 %2, 8
  br i1 %21, label %118, label %22

22:                                               ; preds = %19
  %23 = and i32 %2, -8
  br label %24

24:                                               ; preds = %24, %22
  %25 = phi i32 [ 0, %22 ], [ %114, %24 ]
  %26 = phi i32 [ 0, %22 ], [ %115, %24 ]
  %27 = phi i32 [ 0, %22 ], [ %116, %24 ]
  %28 = zext i32 %26 to i64
  %29 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %28
  %30 = load i32, i32 addrspace(1)* %29, align 4, !tbaa !7, !amdgpu.noclobber !6
  %31 = icmp slt i32 %30, %18
  %32 = icmp eq i32 %18, %30
  %33 = icmp slt i32 %26, %12
  %34 = select i1 %32, i1 %33, i1 false
  %35 = select i1 %31, i1 true, i1 %34
  %36 = zext i1 %35 to i32
  %37 = add nuw nsw i32 %25, %36
  %38 = or i32 %26, 1
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %42 = icmp slt i32 %41, %18
  %43 = icmp eq i32 %18, %41
  %44 = icmp slt i32 %38, %12
  %45 = select i1 %43, i1 %44, i1 false
  %46 = select i1 %42, i1 true, i1 %45
  %47 = zext i1 %46 to i32
  %48 = add nuw nsw i32 %37, %47
  %49 = or i32 %26, 2
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !6
  %53 = icmp slt i32 %52, %18
  %54 = icmp eq i32 %18, %52
  %55 = icmp slt i32 %49, %12
  %56 = select i1 %54, i1 %55, i1 false
  %57 = select i1 %53, i1 true, i1 %56
  %58 = zext i1 %57 to i32
  %59 = add nuw nsw i32 %48, %58
  %60 = or i32 %26, 3
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !7, !amdgpu.noclobber !6
  %64 = icmp slt i32 %63, %18
  %65 = icmp eq i32 %18, %63
  %66 = icmp slt i32 %60, %12
  %67 = select i1 %65, i1 %66, i1 false
  %68 = select i1 %64, i1 true, i1 %67
  %69 = zext i1 %68 to i32
  %70 = add nuw nsw i32 %59, %69
  %71 = or i32 %26, 4
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !6
  %75 = icmp slt i32 %74, %18
  %76 = icmp eq i32 %18, %74
  %77 = icmp slt i32 %71, %12
  %78 = select i1 %76, i1 %77, i1 false
  %79 = select i1 %75, i1 true, i1 %78
  %80 = zext i1 %79 to i32
  %81 = add nuw nsw i32 %70, %80
  %82 = or i32 %26, 5
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !7, !amdgpu.noclobber !6
  %86 = icmp slt i32 %85, %18
  %87 = icmp eq i32 %18, %85
  %88 = icmp slt i32 %82, %12
  %89 = select i1 %87, i1 %88, i1 false
  %90 = select i1 %86, i1 true, i1 %89
  %91 = zext i1 %90 to i32
  %92 = add nuw nsw i32 %81, %91
  %93 = or i32 %26, 6
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %94
  %96 = load i32, i32 addrspace(1)* %95, align 4, !tbaa !7, !amdgpu.noclobber !6
  %97 = icmp slt i32 %96, %18
  %98 = icmp eq i32 %18, %96
  %99 = icmp slt i32 %93, %12
  %100 = select i1 %98, i1 %99, i1 false
  %101 = select i1 %97, i1 true, i1 %100
  %102 = zext i1 %101 to i32
  %103 = add nuw nsw i32 %92, %102
  %104 = or i32 %26, 7
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %105
  %107 = load i32, i32 addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !6
  %108 = icmp slt i32 %107, %18
  %109 = icmp eq i32 %18, %107
  %110 = icmp slt i32 %104, %12
  %111 = select i1 %109, i1 %110, i1 false
  %112 = select i1 %108, i1 true, i1 %111
  %113 = zext i1 %112 to i32
  %114 = add nuw nsw i32 %103, %113
  %115 = add nuw nsw i32 %26, 8
  %116 = add i32 %27, 8
  %117 = icmp eq i32 %116, %23
  br i1 %117, label %118, label %24, !llvm.loop !11

118:                                              ; preds = %24, %19
  %119 = phi i32 [ undef, %19 ], [ %114, %24 ]
  %120 = phi i32 [ 0, %19 ], [ %114, %24 ]
  %121 = phi i32 [ 0, %19 ], [ %115, %24 ]
  %122 = icmp eq i32 %20, 0
  br i1 %122, label %140, label %123

123:                                              ; preds = %118, %123
  %124 = phi i32 [ %136, %123 ], [ %120, %118 ]
  %125 = phi i32 [ %137, %123 ], [ %121, %118 ]
  %126 = phi i32 [ %138, %123 ], [ 0, %118 ]
  %127 = zext i32 %125 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !7, !amdgpu.noclobber !6
  %130 = icmp slt i32 %129, %18
  %131 = icmp eq i32 %18, %129
  %132 = icmp slt i32 %125, %12
  %133 = select i1 %131, i1 %132, i1 false
  %134 = select i1 %130, i1 true, i1 %133
  %135 = zext i1 %134 to i32
  %136 = add nuw nsw i32 %124, %135
  %137 = add nuw nsw i32 %125, 1
  %138 = add i32 %126, 1
  %139 = icmp eq i32 %138, %20
  br i1 %139, label %140, label %123, !llvm.loop !13

140:                                              ; preds = %123, %118
  %141 = phi i32 [ %119, %118 ], [ %136, %123 ]
  %142 = zext i32 %141 to i64
  br label %143

143:                                              ; preds = %140, %14
  %144 = phi i64 [ 0, %14 ], [ %142, %140 ]
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %144
  store i32 %18, i32 addrspace(1)* %145, align 4, !tbaa !7
  br label %146

146:                                              ; preds = %143, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
