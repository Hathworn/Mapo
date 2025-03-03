; ModuleID = '../data/hip_kernels/15394/136/main.cu'
source_filename = "../data/hip_kernels/15394/136/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16reduceSmemUnrollPiS_jE4smem = internal addrspace(3) global [128 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16reduceSmemUnrollPiS_j(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
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
  %14 = mul nuw nsw i32 %10, 3
  %15 = add i32 %13, %14
  %16 = icmp ult i32 %15, %2
  br i1 %16, label %17, label %41

17:                                               ; preds = %3
  %18 = zext i32 %13 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = sitofp i32 %20 to float
  %22 = add i32 %13, %10
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !7, !amdgpu.noclobber !6
  %26 = sitofp i32 %25 to float
  %27 = shl nuw nsw i32 %10, 1
  %28 = add i32 %13, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7, !amdgpu.noclobber !6
  %32 = sitofp i32 %31 to float
  %33 = zext i32 %15 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !6
  %36 = sitofp i32 %35 to float
  %37 = fadd contract float %21, %26
  %38 = fadd contract float %37, %32
  %39 = fadd contract float %38, %36
  %40 = fptosi float %39 to i32
  br label %41

41:                                               ; preds = %17, %3
  %42 = phi i32 [ %40, %17 ], [ 0, %3 ]
  %43 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %4
  store i32 %42, i32 addrspace(3)* %43, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %44 = icmp ugt i16 %9, 1023
  %45 = icmp ult i32 %4, 512
  %46 = select i1 %44, i1 %45, i1 false
  br i1 %46, label %47, label %53

47:                                               ; preds = %41
  %48 = add nuw nsw i32 %4, 512
  %49 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %48
  %50 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !7
  %51 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %52 = add nsw i32 %51, %50
  store i32 %52, i32 addrspace(3)* %43, align 4, !tbaa !7
  br label %53

53:                                               ; preds = %47, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp ugt i16 %9, 511
  %55 = icmp ult i32 %4, 256
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %57, label %63

57:                                               ; preds = %53
  %58 = add nuw nsw i32 %4, 256
  %59 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %58
  %60 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !7
  %61 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %62 = add nsw i32 %61, %60
  store i32 %62, i32 addrspace(3)* %43, align 4, !tbaa !7
  br label %63

63:                                               ; preds = %57, %53
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %64 = icmp ugt i16 %9, 255
  %65 = icmp ult i32 %4, 128
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %73

67:                                               ; preds = %63
  %68 = add nuw nsw i32 %4, 128
  %69 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %68
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !7
  %71 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %72 = add nsw i32 %71, %70
  store i32 %72, i32 addrspace(3)* %43, align 4, !tbaa !7
  br label %73

73:                                               ; preds = %67, %63
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %74 = icmp ugt i16 %9, 127
  %75 = icmp ult i32 %4, 64
  %76 = select i1 %74, i1 %75, i1 false
  br i1 %76, label %77, label %83

77:                                               ; preds = %73
  %78 = add nuw nsw i32 %4, 64
  %79 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %78
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !7
  %81 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %82 = add nsw i32 %81, %80
  store i32 %82, i32 addrspace(3)* %43, align 4, !tbaa !7
  br label %83

83:                                               ; preds = %77, %73
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %84 = icmp ult i32 %4, 32
  br i1 %84, label %85, label %123

85:                                               ; preds = %83
  %86 = add nuw nsw i32 %4, 32
  %87 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %86
  %88 = addrspacecast i32 addrspace(3)* %87 to i32*
  %89 = load volatile i32, i32* %88, align 4, !tbaa !7
  %90 = addrspacecast i32 addrspace(3)* %43 to i32*
  %91 = load volatile i32, i32* %90, align 4, !tbaa !7
  %92 = add nsw i32 %91, %89
  store volatile i32 %92, i32* %90, align 4, !tbaa !7
  %93 = add nuw nsw i32 %4, 16
  %94 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %93
  %95 = addrspacecast i32 addrspace(3)* %94 to i32*
  %96 = load volatile i32, i32* %95, align 4, !tbaa !7
  %97 = load volatile i32, i32* %90, align 4, !tbaa !7
  %98 = add nsw i32 %97, %96
  store volatile i32 %98, i32* %90, align 4, !tbaa !7
  %99 = add nuw nsw i32 %4, 8
  %100 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %99
  %101 = addrspacecast i32 addrspace(3)* %100 to i32*
  %102 = load volatile i32, i32* %101, align 4, !tbaa !7
  %103 = load volatile i32, i32* %90, align 4, !tbaa !7
  %104 = add nsw i32 %103, %102
  store volatile i32 %104, i32* %90, align 4, !tbaa !7
  %105 = add nuw nsw i32 %4, 4
  %106 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %105
  %107 = addrspacecast i32 addrspace(3)* %106 to i32*
  %108 = load volatile i32, i32* %107, align 4, !tbaa !7
  %109 = load volatile i32, i32* %90, align 4, !tbaa !7
  %110 = add nsw i32 %109, %108
  store volatile i32 %110, i32* %90, align 4, !tbaa !7
  %111 = add nuw nsw i32 %4, 2
  %112 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %111
  %113 = addrspacecast i32 addrspace(3)* %112 to i32*
  %114 = load volatile i32, i32* %113, align 4, !tbaa !7
  %115 = load volatile i32, i32* %90, align 4, !tbaa !7
  %116 = add nsw i32 %115, %114
  store volatile i32 %116, i32* %90, align 4, !tbaa !7
  %117 = add nuw nsw i32 %4, 1
  %118 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %117
  %119 = addrspacecast i32 addrspace(3)* %118 to i32*
  %120 = load volatile i32, i32* %119, align 4, !tbaa !7
  %121 = load volatile i32, i32* %90, align 4, !tbaa !7
  %122 = add nsw i32 %121, %120
  store volatile i32 %122, i32* %90, align 4, !tbaa !7
  br label %123

123:                                              ; preds = %85, %83
  %124 = icmp eq i32 %4, 0
  br i1 %124, label %125, label %129

125:                                              ; preds = %123
  %126 = load i32, i32 addrspace(3)* getelementptr inbounds ([128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 0), align 16, !tbaa !7
  %127 = zext i32 %5 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %127
  store i32 %126, i32 addrspace(1)* %128, align 4, !tbaa !7
  br label %129

129:                                              ; preds = %125, %123
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
