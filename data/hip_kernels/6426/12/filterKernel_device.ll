; ModuleID = '../data/hip_kernels/6426/12/main.cu'
source_filename = "../data/hip_kernels/6426/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z12filterKernelPhjjjjb(i8 addrspace(1)* nocapture %0, i32 %1, i32 %2, i32 %3, i32 %4, i1 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = icmp ult i32 %15, %1
  br i1 %16, label %17, label %155

17:                                               ; preds = %6
  %18 = mul i32 %15, %3
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %19
  %21 = mul i32 %3, %1
  %22 = mul i32 %21, %4
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %23
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !7, !amdgpu.noclobber !5
  %26 = zext i8 %25 to i32
  br i1 %5, label %27, label %34

27:                                               ; preds = %17
  %28 = add i32 %2, -1
  %29 = mul i32 %22, %28
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %30
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !7, !amdgpu.noclobber !5
  %33 = zext i8 %32 to i32
  br label %34

34:                                               ; preds = %17, %27
  %35 = phi i32 [ %33, %27 ], [ %26, %17 ]
  %36 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !7, !amdgpu.noclobber !5
  %37 = zext i8 %36 to i32
  %38 = shl nuw nsw i32 %37, 1
  %39 = add nuw nsw i32 %35, %26
  %40 = add nuw nsw i32 %39, %38
  %41 = lshr i32 %40, 2
  %42 = trunc i32 %41 to i8
  store i8 %42, i8 addrspace(1)* %20, align 1, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp ugt i32 %2, 2
  br i1 %43, label %44, label %155

44:                                               ; preds = %34
  %45 = add i32 %2, -3
  %46 = lshr i32 %45, 1
  %47 = add nuw i32 %46, 1
  %48 = and i32 %47, 3
  %49 = icmp ult i32 %45, 6
  br i1 %49, label %128, label %50

50:                                               ; preds = %44
  %51 = and i32 %47, -4
  br label %52

52:                                               ; preds = %52, %50
  %53 = phi i32 [ %26, %50 ], [ %112, %52 ]
  %54 = phi i32 [ 2, %50 ], [ %123, %52 ]
  %55 = phi i32 [ 0, %50 ], [ %124, %52 ]
  %56 = or i32 %54, 1
  %57 = mul i32 %56, %22
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %58
  %60 = load i8, i8 addrspace(1)* %59, align 1, !tbaa !7
  %61 = zext i8 %60 to i32
  %62 = mul i32 %54, %22
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7
  %66 = zext i8 %65 to i32
  %67 = shl nuw nsw i32 %66, 1
  %68 = add nuw nsw i32 %53, %61
  %69 = add nuw nsw i32 %68, %67
  %70 = lshr i32 %69, 2
  %71 = trunc i32 %70 to i8
  store i8 %71, i8 addrspace(1)* %64, align 1, !tbaa !7
  %72 = add nuw nsw i32 %54, 2
  %73 = or i32 %72, 1
  %74 = mul i32 %73, %22
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %75
  %77 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !7
  %78 = zext i8 %77 to i32
  %79 = mul i32 %72, %22
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !7
  %83 = zext i8 %82 to i32
  %84 = shl nuw nsw i32 %83, 1
  %85 = add nuw nsw i32 %61, %78
  %86 = add nuw nsw i32 %85, %84
  %87 = lshr i32 %86, 2
  %88 = trunc i32 %87 to i8
  store i8 %88, i8 addrspace(1)* %81, align 1, !tbaa !7
  %89 = add nuw nsw i32 %54, 4
  %90 = or i32 %89, 1
  %91 = mul i32 %90, %22
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %92
  %94 = load i8, i8 addrspace(1)* %93, align 1, !tbaa !7
  %95 = zext i8 %94 to i32
  %96 = mul i32 %89, %22
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %97
  %99 = load i8, i8 addrspace(1)* %98, align 1, !tbaa !7
  %100 = zext i8 %99 to i32
  %101 = shl nuw nsw i32 %100, 1
  %102 = add nuw nsw i32 %78, %95
  %103 = add nuw nsw i32 %102, %101
  %104 = lshr i32 %103, 2
  %105 = trunc i32 %104 to i8
  store i8 %105, i8 addrspace(1)* %98, align 1, !tbaa !7
  %106 = add nuw i32 %54, 6
  %107 = or i32 %106, 1
  %108 = mul i32 %107, %22
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %109
  %111 = load i8, i8 addrspace(1)* %110, align 1, !tbaa !7
  %112 = zext i8 %111 to i32
  %113 = mul i32 %106, %22
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %114
  %116 = load i8, i8 addrspace(1)* %115, align 1, !tbaa !7
  %117 = zext i8 %116 to i32
  %118 = shl nuw nsw i32 %117, 1
  %119 = add nuw nsw i32 %95, %112
  %120 = add nuw nsw i32 %119, %118
  %121 = lshr i32 %120, 2
  %122 = trunc i32 %121 to i8
  store i8 %122, i8 addrspace(1)* %115, align 1, !tbaa !7
  %123 = add nuw i32 %54, 8
  %124 = add i32 %55, 4
  %125 = icmp eq i32 %124, %51
  br i1 %125, label %126, label %52, !llvm.loop !10

126:                                              ; preds = %52
  %127 = zext i8 %111 to i32
  br label %128

128:                                              ; preds = %126, %44
  %129 = phi i32 [ %26, %44 ], [ %127, %126 ]
  %130 = phi i32 [ 2, %44 ], [ %123, %126 ]
  %131 = icmp eq i32 %48, 0
  br i1 %131, label %155, label %132

132:                                              ; preds = %128, %132
  %133 = phi i32 [ %141, %132 ], [ %129, %128 ]
  %134 = phi i32 [ %152, %132 ], [ %130, %128 ]
  %135 = phi i32 [ %153, %132 ], [ 0, %128 ]
  %136 = or i32 %134, 1
  %137 = mul i32 %136, %22
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %138
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !7
  %141 = zext i8 %140 to i32
  %142 = mul i32 %134, %22
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %20, i64 %143
  %145 = load i8, i8 addrspace(1)* %144, align 1, !tbaa !7
  %146 = zext i8 %145 to i32
  %147 = shl nuw nsw i32 %146, 1
  %148 = add nuw nsw i32 %133, %141
  %149 = add nuw nsw i32 %148, %147
  %150 = lshr i32 %149, 2
  %151 = trunc i32 %150 to i8
  store i8 %151, i8 addrspace(1)* %144, align 1, !tbaa !7
  %152 = add nuw i32 %134, 2
  %153 = add i32 %135, 1
  %154 = icmp eq i32 %153, %48
  br i1 %154, label %155, label %132, !llvm.loop !12

155:                                              ; preds = %128, %132, %34, %6
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
