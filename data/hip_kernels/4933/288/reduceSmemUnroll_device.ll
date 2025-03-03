; ModuleID = '../data/hip_kernels/4933/288/main.cu'
source_filename = "../data/hip_kernels/4933/288/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16reduceSmemUnrollPiS_jE4smem = internal addrspace(3) global [1024 x i32] undef, align 16

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
  %14 = icmp ult i32 %13, %2
  br i1 %14, label %15, label %48

15:                                               ; preds = %3
  %16 = zext i32 %13 to i64
  %17 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %16
  %18 = load i32, i32 addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !6
  %19 = add i32 %13, %10
  %20 = icmp ult i32 %19, %2
  br i1 %20, label %21, label %25

21:                                               ; preds = %15
  %22 = zext i32 %19 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %22
  %24 = load i32, i32 addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %25

25:                                               ; preds = %21, %15
  %26 = phi i32 [ %24, %21 ], [ 0, %15 ]
  %27 = shl nuw nsw i32 %10, 1
  %28 = add i32 %13, %27
  %29 = icmp ult i32 %28, %2
  br i1 %29, label %30, label %34

30:                                               ; preds = %25
  %31 = zext i32 %28 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %34

34:                                               ; preds = %30, %25
  %35 = phi i32 [ %33, %30 ], [ 0, %25 ]
  %36 = mul nuw nsw i32 %10, 3
  %37 = add i32 %13, %36
  %38 = icmp ult i32 %37, %2
  br i1 %38, label %39, label %43

39:                                               ; preds = %34
  %40 = zext i32 %37 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !6
  br label %43

43:                                               ; preds = %39, %34
  %44 = phi i32 [ %42, %39 ], [ 0, %34 ]
  %45 = add nsw i32 %26, %18
  %46 = add nsw i32 %45, %35
  %47 = add nsw i32 %46, %44
  br label %48

48:                                               ; preds = %43, %3
  %49 = phi i32 [ %47, %43 ], [ 0, %3 ]
  %50 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %4
  store i32 %49, i32 addrspace(3)* %50, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp ugt i16 %9, 1023
  %52 = icmp ult i32 %4, 512
  %53 = select i1 %51, i1 %52, i1 false
  br i1 %53, label %54, label %60

54:                                               ; preds = %48
  %55 = add nuw nsw i32 %4, 512
  %56 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %55
  %57 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !7
  %58 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %59 = add nsw i32 %58, %57
  store i32 %59, i32 addrspace(3)* %50, align 4, !tbaa !7
  br label %60

60:                                               ; preds = %54, %48
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = icmp ugt i16 %9, 511
  %62 = icmp ult i32 %4, 256
  %63 = select i1 %61, i1 %62, i1 false
  br i1 %63, label %64, label %70

64:                                               ; preds = %60
  %65 = add nuw nsw i32 %4, 256
  %66 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !7
  %68 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %69 = add nsw i32 %68, %67
  store i32 %69, i32 addrspace(3)* %50, align 4, !tbaa !7
  br label %70

70:                                               ; preds = %64, %60
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %71 = icmp ugt i16 %9, 255
  %72 = icmp ult i32 %4, 128
  %73 = select i1 %71, i1 %72, i1 false
  br i1 %73, label %74, label %80

74:                                               ; preds = %70
  %75 = add nuw nsw i32 %4, 128
  %76 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %75
  %77 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %78 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %79 = add nsw i32 %78, %77
  store i32 %79, i32 addrspace(3)* %50, align 4, !tbaa !7
  br label %80

80:                                               ; preds = %74, %70
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %81 = icmp ugt i16 %9, 127
  %82 = icmp ult i32 %4, 64
  %83 = select i1 %81, i1 %82, i1 false
  br i1 %83, label %84, label %90

84:                                               ; preds = %80
  %85 = add nuw nsw i32 %4, 64
  %86 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %85
  %87 = load i32, i32 addrspace(3)* %86, align 4, !tbaa !7
  %88 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %89 = add nsw i32 %88, %87
  store i32 %89, i32 addrspace(3)* %50, align 4, !tbaa !7
  br label %90

90:                                               ; preds = %84, %80
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = icmp ult i32 %4, 32
  br i1 %91, label %92, label %130

92:                                               ; preds = %90
  %93 = add nuw nsw i32 %4, 32
  %94 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %93
  %95 = addrspacecast i32 addrspace(3)* %94 to i32*
  %96 = load volatile i32, i32* %95, align 4, !tbaa !7
  %97 = addrspacecast i32 addrspace(3)* %50 to i32*
  %98 = load volatile i32, i32* %97, align 4, !tbaa !7
  %99 = add nsw i32 %98, %96
  store volatile i32 %99, i32* %97, align 4, !tbaa !7
  %100 = add nuw nsw i32 %4, 16
  %101 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %100
  %102 = addrspacecast i32 addrspace(3)* %101 to i32*
  %103 = load volatile i32, i32* %102, align 4, !tbaa !7
  %104 = load volatile i32, i32* %97, align 4, !tbaa !7
  %105 = add nsw i32 %104, %103
  store volatile i32 %105, i32* %97, align 4, !tbaa !7
  %106 = add nuw nsw i32 %4, 8
  %107 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %106
  %108 = addrspacecast i32 addrspace(3)* %107 to i32*
  %109 = load volatile i32, i32* %108, align 4, !tbaa !7
  %110 = load volatile i32, i32* %97, align 4, !tbaa !7
  %111 = add nsw i32 %110, %109
  store volatile i32 %111, i32* %97, align 4, !tbaa !7
  %112 = add nuw nsw i32 %4, 4
  %113 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %112
  %114 = addrspacecast i32 addrspace(3)* %113 to i32*
  %115 = load volatile i32, i32* %114, align 4, !tbaa !7
  %116 = load volatile i32, i32* %97, align 4, !tbaa !7
  %117 = add nsw i32 %116, %115
  store volatile i32 %117, i32* %97, align 4, !tbaa !7
  %118 = add nuw nsw i32 %4, 2
  %119 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %118
  %120 = addrspacecast i32 addrspace(3)* %119 to i32*
  %121 = load volatile i32, i32* %120, align 4, !tbaa !7
  %122 = load volatile i32, i32* %97, align 4, !tbaa !7
  %123 = add nsw i32 %122, %121
  store volatile i32 %123, i32* %97, align 4, !tbaa !7
  %124 = add nuw nsw i32 %4, 1
  %125 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 %124
  %126 = addrspacecast i32 addrspace(3)* %125 to i32*
  %127 = load volatile i32, i32* %126, align 4, !tbaa !7
  %128 = load volatile i32, i32* %97, align 4, !tbaa !7
  %129 = add nsw i32 %128, %127
  store volatile i32 %129, i32* %97, align 4, !tbaa !7
  br label %130

130:                                              ; preds = %92, %90
  %131 = icmp eq i32 %4, 0
  br i1 %131, label %132, label %136

132:                                              ; preds = %130
  %133 = load i32, i32 addrspace(3)* getelementptr inbounds ([1024 x i32], [1024 x i32] addrspace(3)* @_ZZ16reduceSmemUnrollPiS_jE4smem, i32 0, i32 0), align 16, !tbaa !7
  %134 = zext i32 %5 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %134
  store i32 %133, i32 addrspace(1)* %135, align 4, !tbaa !7
  br label %136

136:                                              ; preds = %132, %130
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
