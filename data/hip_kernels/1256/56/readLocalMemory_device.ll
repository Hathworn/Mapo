; ModuleID = '../data/hip_kernels/1256/56/main.cu'
source_filename = "../data/hip_kernels/1256/56/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15readLocalMemoryPKfPfiiE4lbuf = internal unnamed_addr addrspace(3) global [2048 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15readLocalMemoryPKfPfii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = udiv i16 2048, %9
  %14 = zext i16 %13 to i32
  %15 = mul nuw nsw i32 %5, %14
  %16 = add nsw i32 %15, %12
  %17 = sub nsw i32 %2, %16
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %22, label %19

19:                                               ; preds = %22, %4
  %20 = phi i32 [ 0, %4 ], [ %30, %22 ]
  %21 = icmp ult i32 %20, %14
  br i1 %21, label %36, label %34

22:                                               ; preds = %4, %22
  %23 = phi i32 [ %30, %22 ], [ 0, %4 ]
  %24 = add nsw i32 %23, %16
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = add nuw nsw i32 %23, %15
  %29 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %28
  store float %27, float addrspace(3)* %29, align 4, !tbaa !7
  %30 = add nuw nsw i32 %23, 1
  %31 = icmp ult i32 %30, %14
  %32 = icmp slt i32 %30, %17
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %22, label %19, !llvm.loop !11

34:                                               ; preds = %36, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp sgt i32 %3, 0
  br i1 %35, label %47, label %133

36:                                               ; preds = %19, %36
  %37 = phi i32 [ %44, %36 ], [ %20, %19 ]
  %38 = phi i32 [ %45, %36 ], [ 0, %19 ]
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %0, i64 %39
  %41 = load float, float addrspace(1)* %40, align 4, !tbaa !7, !amdgpu.noclobber !6
  %42 = add nuw nsw i32 %37, %15
  %43 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %42
  store float %41, float addrspace(3)* %43, align 4, !tbaa !7
  %44 = add nuw nsw i32 %37, 1
  %45 = add nuw nsw i32 %38, 1
  %46 = icmp ult i32 %44, %14
  br i1 %46, label %36, label %34, !llvm.loop !13

47:                                               ; preds = %34, %47
  %48 = phi i32 [ %131, %47 ], [ 0, %34 ]
  %49 = phi float [ %128, %47 ], [ 0.000000e+00, %34 ]
  %50 = phi i32 [ %130, %47 ], [ %5, %34 ]
  %51 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %50
  %52 = load float, float addrspace(3)* %51, align 4, !tbaa !7
  %53 = add nuw nsw i32 %50, 1
  %54 = and i32 %53, 2047
  %55 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %54
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !7
  %57 = add nuw nsw i32 %50, 2
  %58 = and i32 %57, 2047
  %59 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %58
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !7
  %61 = add nuw nsw i32 %50, 3
  %62 = and i32 %61, 2047
  %63 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %62
  %64 = load float, float addrspace(3)* %63, align 4, !tbaa !7
  %65 = add nuw nsw i32 %50, 4
  %66 = and i32 %65, 2047
  %67 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %66
  %68 = load float, float addrspace(3)* %67, align 4, !tbaa !7
  %69 = add nuw nsw i32 %50, 5
  %70 = and i32 %69, 2047
  %71 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %70
  %72 = load float, float addrspace(3)* %71, align 4, !tbaa !7
  %73 = add nuw nsw i32 %50, 6
  %74 = and i32 %73, 2047
  %75 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %74
  %76 = load float, float addrspace(3)* %75, align 4, !tbaa !7
  %77 = add nuw nsw i32 %50, 7
  %78 = and i32 %77, 2047
  %79 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %78
  %80 = load float, float addrspace(3)* %79, align 4, !tbaa !7
  %81 = add nuw nsw i32 %50, 8
  %82 = and i32 %81, 2047
  %83 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %82
  %84 = load float, float addrspace(3)* %83, align 4, !tbaa !7
  %85 = add nuw nsw i32 %50, 9
  %86 = and i32 %85, 2047
  %87 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %86
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !7
  %89 = add nuw nsw i32 %50, 10
  %90 = and i32 %89, 2047
  %91 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !7
  %93 = add nuw nsw i32 %50, 11
  %94 = and i32 %93, 2047
  %95 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %94
  %96 = load float, float addrspace(3)* %95, align 4, !tbaa !7
  %97 = add nuw nsw i32 %50, 12
  %98 = and i32 %97, 2047
  %99 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %98
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !7
  %101 = add nuw nsw i32 %50, 13
  %102 = and i32 %101, 2047
  %103 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %102
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !7
  %105 = add nuw nsw i32 %50, 14
  %106 = and i32 %105, 2047
  %107 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %106
  %108 = load float, float addrspace(3)* %107, align 4, !tbaa !7
  %109 = add nuw nsw i32 %50, 15
  %110 = and i32 %109, 2047
  %111 = getelementptr inbounds [2048 x float], [2048 x float] addrspace(3)* @_ZZ15readLocalMemoryPKfPfiiE4lbuf, i32 0, i32 %110
  %112 = load float, float addrspace(3)* %111, align 4, !tbaa !7
  %113 = fadd contract float %52, %56
  %114 = fadd contract float %113, %60
  %115 = fadd contract float %114, %64
  %116 = fadd contract float %115, %68
  %117 = fadd contract float %116, %72
  %118 = fadd contract float %117, %76
  %119 = fadd contract float %118, %80
  %120 = fadd contract float %119, %84
  %121 = fadd contract float %120, %88
  %122 = fadd contract float %121, %92
  %123 = fadd contract float %122, %96
  %124 = fadd contract float %123, %100
  %125 = fadd contract float %124, %104
  %126 = fadd contract float %125, %108
  %127 = fadd contract float %126, %112
  %128 = fadd contract float %49, %127
  %129 = add nuw nsw i32 %50, 16
  %130 = and i32 %129, 2047
  %131 = add nuw nsw i32 %48, 1
  %132 = icmp eq i32 %131, %3
  br i1 %132, label %133, label %47, !llvm.loop !14

133:                                              ; preds = %47, %34
  %134 = phi float [ 0.000000e+00, %34 ], [ %128, %47 ]
  %135 = add i32 %12, %5
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds float, float addrspace(1)* %1, i64 %136
  store float %134, float addrspace(1)* %137, align 4, !tbaa !7
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
