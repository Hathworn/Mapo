; ModuleID = '../data/hip_kernels/5994/12/main.cu'
source_filename = "../data/hip_kernels/5994/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17reduceUnrollWarp8PiS_j(i32 addrspace(1)* %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = shl i32 %10, 3
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = mul nuw nsw i32 %9, 7
  %17 = add i32 %12, %16
  %18 = icmp ult i32 %17, %2
  br i1 %18, label %19, label %62

19:                                               ; preds = %3
  %20 = sext i32 %12 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = add i32 %12, %9
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %24
  %26 = load i32, i32 addrspace(1)* %25, align 4, !tbaa !7, !amdgpu.noclobber !5
  %27 = shl nuw nsw i32 %9, 1
  %28 = add i32 %12, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !5
  %32 = mul nuw nsw i32 %9, 3
  %33 = add i32 %12, %32
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !5
  %37 = shl nuw nsw i32 %9, 2
  %38 = add i32 %12, %37
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %39
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !5
  %42 = mul nuw nsw i32 %9, 5
  %43 = add i32 %12, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %44
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !7, !amdgpu.noclobber !5
  %47 = mul nuw nsw i32 %9, 6
  %48 = add i32 %12, %47
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !5
  %52 = zext i32 %17 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !7, !amdgpu.noclobber !5
  %55 = add nsw i32 %26, %22
  %56 = add nsw i32 %55, %31
  %57 = add nsw i32 %56, %36
  %58 = add nsw i32 %57, %41
  %59 = add nsw i32 %58, %46
  %60 = add nsw i32 %59, %51
  %61 = add nsw i32 %60, %54
  store i32 %61, i32 addrspace(1)* %21, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %19, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %63 = icmp ult i32 %12, %2
  br i1 %63, label %64, label %136

64:                                               ; preds = %62
  %65 = icmp ugt i16 %8, 65
  br i1 %65, label %66, label %69

66:                                               ; preds = %64
  %67 = zext i32 %11 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %67
  br label %71

69:                                               ; preds = %82, %64
  %70 = icmp ult i32 %11, 32
  br i1 %70, label %84, label %130

71:                                               ; preds = %66, %82
  %72 = phi i32 [ %9, %66 ], [ %73, %82 ]
  %73 = lshr i32 %72, 1
  %74 = icmp ult i32 %11, %73
  br i1 %74, label %75, label %82

75:                                               ; preds = %71
  %76 = add nuw nsw i32 %73, %11
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !7
  %80 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %81 = add nsw i32 %80, %79
  store i32 %81, i32 addrspace(1)* %68, align 4, !tbaa !7
  br label %82

82:                                               ; preds = %75, %71
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %83 = icmp ugt i32 %72, 131
  br i1 %83, label %71, label %69, !llvm.loop !11

84:                                               ; preds = %69
  %85 = add nuw nsw i32 %11, 32
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %86
  %88 = addrspacecast i32 addrspace(1)* %87 to i32*
  %89 = load volatile i32, i32* %88, align 4, !tbaa !7
  %90 = zext i32 %11 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %90
  %92 = addrspacecast i32 addrspace(1)* %91 to i32*
  %93 = load volatile i32, i32* %92, align 4, !tbaa !7
  %94 = add nsw i32 %93, %89
  store volatile i32 %94, i32* %92, align 4, !tbaa !7
  %95 = add nuw nsw i32 %11, 16
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %96
  %98 = addrspacecast i32 addrspace(1)* %97 to i32*
  %99 = load volatile i32, i32* %98, align 4, !tbaa !7
  %100 = load volatile i32, i32* %92, align 4, !tbaa !7
  %101 = add nsw i32 %100, %99
  store volatile i32 %101, i32* %92, align 4, !tbaa !7
  %102 = add nuw nsw i32 %11, 8
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %103
  %105 = addrspacecast i32 addrspace(1)* %104 to i32*
  %106 = load volatile i32, i32* %105, align 4, !tbaa !7
  %107 = load volatile i32, i32* %92, align 4, !tbaa !7
  %108 = add nsw i32 %107, %106
  store volatile i32 %108, i32* %92, align 4, !tbaa !7
  %109 = add nuw nsw i32 %11, 4
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %110
  %112 = addrspacecast i32 addrspace(1)* %111 to i32*
  %113 = load volatile i32, i32* %112, align 4, !tbaa !7
  %114 = load volatile i32, i32* %92, align 4, !tbaa !7
  %115 = add nsw i32 %114, %113
  store volatile i32 %115, i32* %92, align 4, !tbaa !7
  %116 = add nuw nsw i32 %11, 2
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %117
  %119 = addrspacecast i32 addrspace(1)* %118 to i32*
  %120 = load volatile i32, i32* %119, align 4, !tbaa !7
  %121 = load volatile i32, i32* %92, align 4, !tbaa !7
  %122 = add nsw i32 %121, %120
  store volatile i32 %122, i32* %92, align 4, !tbaa !7
  %123 = add nuw nsw i32 %11, 1
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %15, i64 %124
  %126 = addrspacecast i32 addrspace(1)* %125 to i32*
  %127 = load volatile i32, i32* %126, align 4, !tbaa !7
  %128 = load volatile i32, i32* %92, align 4, !tbaa !7
  %129 = add nsw i32 %128, %127
  store volatile i32 %129, i32* %92, align 4, !tbaa !7
  br label %130

130:                                              ; preds = %84, %69
  %131 = icmp eq i32 %11, 0
  br i1 %131, label %132, label %136

132:                                              ; preds = %130
  %133 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7
  %134 = zext i32 %4 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %134
  store i32 %133, i32 addrspace(1)* %135, align 4, !tbaa !7
  br label %136

136:                                              ; preds = %130, %132, %62
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
