; ModuleID = '../data/hip_kernels/4933/287/main.cu'
source_filename = "../data/hip_kernels/4933/287/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16reduceGmemUnrollPiS_j(i32 addrspace(1)* %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = shl i32 %5, 2
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %4
  %14 = zext i32 %12 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = icmp ult i32 %13, %2
  br i1 %16, label %17, label %50

17:                                               ; preds = %3
  %18 = zext i32 %13 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = add i32 %13, %10
  %22 = icmp ult i32 %21, %2
  br i1 %22, label %23, label %27

23:                                               ; preds = %17
  %24 = zext i32 %21 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %27

27:                                               ; preds = %23, %17
  %28 = phi i32 [ %26, %23 ], [ 0, %17 ]
  %29 = shl nuw nsw i32 %10, 1
  %30 = add i32 %13, %29
  %31 = icmp ult i32 %30, %2
  br i1 %31, label %32, label %36

32:                                               ; preds = %27
  %33 = zext i32 %30 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %36

36:                                               ; preds = %32, %27
  %37 = phi i32 [ %35, %32 ], [ 0, %27 ]
  %38 = mul nuw nsw i32 %10, 3
  %39 = add i32 %13, %38
  %40 = icmp ult i32 %39, %2
  br i1 %40, label %41, label %45

41:                                               ; preds = %36
  %42 = zext i32 %39 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %45

45:                                               ; preds = %41, %36
  %46 = phi i32 [ %44, %41 ], [ 0, %36 ]
  %47 = add nsw i32 %28, %20
  %48 = add nsw i32 %47, %37
  %49 = add nsw i32 %48, %46
  store i32 %49, i32 addrspace(1)* %19, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %45, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp ugt i16 %9, 1023
  %52 = icmp ult i32 %4, 512
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %63

54:                                               ; preds = %50
  %55 = add nuw nsw i32 %4, 512
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7
  %59 = zext i32 %4 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !7
  %62 = add nsw i32 %61, %58
  store i32 %62, i32 addrspace(1)* %60, align 4, !tbaa !7
  br label %63

63:                                               ; preds = %54, %50
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = icmp ugt i16 %9, 511
  %65 = icmp ult i32 %4, 256
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %76

67:                                               ; preds = %63
  %68 = add nuw nsw i32 %4, 256
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %69
  %71 = load i32, i32 addrspace(1)* %70, align 4, !tbaa !7
  %72 = zext i32 %4 to i64
  %73 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %72
  %74 = load i32, i32 addrspace(1)* %73, align 4, !tbaa !7
  %75 = add nsw i32 %74, %71
  store i32 %75, i32 addrspace(1)* %73, align 4, !tbaa !7
  br label %76

76:                                               ; preds = %67, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = icmp ugt i16 %9, 255
  %78 = icmp ult i32 %4, 128
  %79 = select i1 %77, i1 %78, i1 false
  br i1 %79, label %80, label %89

80:                                               ; preds = %76
  %81 = add nuw nsw i32 %4, 128
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %82
  %84 = load i32, i32 addrspace(1)* %83, align 4, !tbaa !7
  %85 = zext i32 %4 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7
  %88 = add nsw i32 %87, %84
  store i32 %88, i32 addrspace(1)* %86, align 4, !tbaa !7
  br label %89

89:                                               ; preds = %80, %76
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = icmp ugt i16 %9, 127
  %91 = icmp ult i32 %4, 64
  %92 = select i1 %90, i1 %91, i1 false
  br i1 %92, label %93, label %102

93:                                               ; preds = %89
  %94 = add nuw nsw i32 %4, 64
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7
  %98 = zext i32 %4 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7
  %101 = add nsw i32 %100, %97
  store i32 %101, i32 addrspace(1)* %99, align 4, !tbaa !7
  br label %102

102:                                              ; preds = %93, %89
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %103 = icmp ult i32 %4, 32
  br i1 %103, label %104, label %150

104:                                              ; preds = %102
  %105 = add nuw nsw i32 %4, 32
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %106
  %108 = addrspacecast i32 addrspace(1)* %107 to i32*
  %109 = load volatile i32, i32* %108, align 4, !tbaa !7
  %110 = zext i32 %4 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %110
  %112 = addrspacecast i32 addrspace(1)* %111 to i32*
  %113 = load volatile i32, i32* %112, align 4, !tbaa !7
  %114 = add nsw i32 %113, %109
  store volatile i32 %114, i32* %112, align 4, !tbaa !7
  %115 = add nuw nsw i32 %4, 16
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %116
  %118 = addrspacecast i32 addrspace(1)* %117 to i32*
  %119 = load volatile i32, i32* %118, align 4, !tbaa !7
  %120 = load volatile i32, i32* %112, align 4, !tbaa !7
  %121 = add nsw i32 %120, %119
  store volatile i32 %121, i32* %112, align 4, !tbaa !7
  %122 = add nuw nsw i32 %4, 8
  %123 = zext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %123
  %125 = addrspacecast i32 addrspace(1)* %124 to i32*
  %126 = load volatile i32, i32* %125, align 4, !tbaa !7
  %127 = load volatile i32, i32* %112, align 4, !tbaa !7
  %128 = add nsw i32 %127, %126
  store volatile i32 %128, i32* %112, align 4, !tbaa !7
  %129 = add nuw nsw i32 %4, 4
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %130
  %132 = addrspacecast i32 addrspace(1)* %131 to i32*
  %133 = load volatile i32, i32* %132, align 4, !tbaa !7
  %134 = load volatile i32, i32* %112, align 4, !tbaa !7
  %135 = add nsw i32 %134, %133
  store volatile i32 %135, i32* %112, align 4, !tbaa !7
  %136 = add nuw nsw i32 %4, 2
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %137
  %139 = addrspacecast i32 addrspace(1)* %138 to i32*
  %140 = load volatile i32, i32* %139, align 4, !tbaa !7
  %141 = load volatile i32, i32* %112, align 4, !tbaa !7
  %142 = add nsw i32 %141, %140
  store volatile i32 %142, i32* %112, align 4, !tbaa !7
  %143 = add nuw nsw i32 %4, 1
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %144
  %146 = addrspacecast i32 addrspace(1)* %145 to i32*
  %147 = load volatile i32, i32* %146, align 4, !tbaa !7
  %148 = load volatile i32, i32* %112, align 4, !tbaa !7
  %149 = add nsw i32 %148, %147
  store volatile i32 %149, i32* %112, align 4, !tbaa !7
  br label %150

150:                                              ; preds = %104, %102
  %151 = icmp eq i32 %4, 0
  br i1 %151, label %152, label %156

152:                                              ; preds = %150
  %153 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %154 = zext i32 %5 to i64
  %155 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %154
  store i32 %153, i32 addrspace(1)* %155, align 4, !tbaa !7
  br label %156

156:                                              ; preds = %152, %150
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
