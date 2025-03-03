; ModuleID = '../data/hip_kernels/11832/293/main.cu'
source_filename = "../data/hip_kernels/11832/293/main.cu"
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
  %14 = shl nuw nsw i32 %10, 2
  %15 = add i32 %13, %14
  %16 = icmp ugt i32 %15, %2
  br i1 %16, label %38, label %17

17:                                               ; preds = %3
  %18 = zext i32 %13 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !7, !amdgpu.noclobber !6
  %21 = add i32 %13, %10
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = shl nuw nsw i32 %10, 1
  %26 = add i32 %13, %25
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = mul nuw nsw i32 %10, 3
  %31 = add i32 %13, %30
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %32
  %34 = load i32, i32 addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = add nsw i32 %24, %20
  %36 = add nsw i32 %35, %29
  %37 = add nsw i32 %36, %34
  br label %38

38:                                               ; preds = %17, %3
  %39 = phi i32 [ %37, %17 ], [ 0, %3 ]
  %40 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %4
  store i32 %39, i32 addrspace(3)* %40, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = icmp ugt i16 %9, 1023
  %42 = icmp ult i32 %4, 512
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %44, label %50

44:                                               ; preds = %38
  %45 = add nuw nsw i32 %4, 512
  %46 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %45
  %47 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !7
  %48 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !7
  %49 = add nsw i32 %48, %47
  store i32 %49, i32 addrspace(3)* %40, align 4, !tbaa !7
  br label %50

50:                                               ; preds = %44, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp ugt i16 %9, 511
  %52 = icmp ult i32 %4, 256
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %60

54:                                               ; preds = %50
  %55 = add nuw nsw i32 %4, 256
  %56 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %55
  %57 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !7
  %58 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !7
  %59 = add nsw i32 %58, %57
  store i32 %59, i32 addrspace(3)* %40, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %54, %50
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = icmp ugt i16 %9, 255
  %62 = icmp ult i32 %4, 128
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %64, label %70

64:                                               ; preds = %60
  %65 = add nuw nsw i32 %4, 128
  %66 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !7
  %68 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !7
  %69 = add nsw i32 %68, %67
  store i32 %69, i32 addrspace(3)* %40, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %64, %60
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = icmp ugt i16 %9, 127
  %72 = icmp ult i32 %4, 64
  %73 = select i1 %71, i1 %72, i1 false
  br i1 %73, label %74, label %80

74:                                               ; preds = %70
  %75 = add nuw nsw i32 %4, 64
  %76 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %75
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %78 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !7
  %79 = add nsw i32 %78, %77
  store i32 %79, i32 addrspace(3)* %40, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %74, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp ult i32 %4, 32
  br i1 %81, label %82, label %120

82:                                               ; preds = %80
  %83 = add nuw nsw i32 %4, 32
  %84 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %83
  %85 = addrspacecast i32 addrspace(3)* %84 to i32*
  %86 = load volatile i32, i32* %85, align 4, !tbaa !7
  %87 = addrspacecast i32 addrspace(3)* %40 to i32*
  %88 = load volatile i32, i32* %87, align 4, !tbaa !7
  %89 = add nsw i32 %88, %86
  store volatile i32 %89, i32* %87, align 4, !tbaa !7
  %90 = add nuw nsw i32 %4, 16
  %91 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %90
  %92 = addrspacecast i32 addrspace(3)* %91 to i32*
  %93 = load volatile i32, i32* %92, align 4, !tbaa !7
  %94 = load volatile i32, i32* %87, align 4, !tbaa !7
  %95 = add nsw i32 %94, %93
  store volatile i32 %95, i32* %87, align 4, !tbaa !7
  %96 = add nuw nsw i32 %4, 8
  %97 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %96
  %98 = addrspacecast i32 addrspace(3)* %97 to i32*
  %99 = load volatile i32, i32* %98, align 4, !tbaa !7
  %100 = load volatile i32, i32* %87, align 4, !tbaa !7
  %101 = add nsw i32 %100, %99
  store volatile i32 %101, i32* %87, align 4, !tbaa !7
  %102 = add nuw nsw i32 %4, 4
  %103 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %102
  %104 = addrspacecast i32 addrspace(3)* %103 to i32*
  %105 = load volatile i32, i32* %104, align 4, !tbaa !7
  %106 = load volatile i32, i32* %87, align 4, !tbaa !7
  %107 = add nsw i32 %106, %105
  store volatile i32 %107, i32* %87, align 4, !tbaa !7
  %108 = add nuw nsw i32 %4, 2
  %109 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %108
  %110 = addrspacecast i32 addrspace(3)* %109 to i32*
  %111 = load volatile i32, i32* %110, align 4, !tbaa !7
  %112 = load volatile i32, i32* %87, align 4, !tbaa !7
  %113 = add nsw i32 %112, %111
  store volatile i32 %113, i32* %87, align 4, !tbaa !7
  %114 = add nuw nsw i32 %4, 1
  %115 = getelementptr inbounds [128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %114
  %116 = addrspacecast i32 addrspace(3)* %115 to i32*
  %117 = load volatile i32, i32* %116, align 4, !tbaa !7
  %118 = load volatile i32, i32* %87, align 4, !tbaa !7
  %119 = add nsw i32 %118, %117
  store volatile i32 %119, i32* %87, align 4, !tbaa !7
  br label %120

120:                                              ; preds = %82, %80
  %121 = icmp eq i32 %4, 0
  br i1 %121, label %122, label %126

122:                                              ; preds = %120
  %123 = load i32, i32 addrspace(3)* getelementptr inbounds ([128 x i32], [128 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 0), align 16, !tbaa !7
  %124 = zext i32 %5 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %124
  store i32 %123, i32 addrspace(1)* %125, align 4, !tbaa !7
  br label %126

126:                                              ; preds = %122, %120
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
