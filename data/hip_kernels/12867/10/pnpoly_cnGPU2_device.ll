; ModuleID = '../data/hip_kernels/12867/10/main.cu'
source_filename = "../data/hip_kernels/12867/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13pnpoly_cnGPU2PKfS0_S0_S0_Pcii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i8 addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = icmp slt i32 %16, %5
  br i1 %17, label %18, label %129

18:                                               ; preds = %7
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds float, float addrspace(1)* %0, i64 %19
  %21 = load float, float addrspace(1)* %20, align 4, !tbaa !7, !amdgpu.noclobber !5
  %22 = getelementptr inbounds float, float addrspace(1)* %1, i64 %19
  %23 = load float, float addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = icmp sgt i32 %6, 0
  br i1 %24, label %25, label %124

25:                                               ; preds = %18
  %26 = add i32 %6, -1
  %27 = and i32 %6, 1
  %28 = icmp eq i32 %26, 0
  br i1 %28, label %94, label %29

29:                                               ; preds = %25
  %30 = and i32 %6, -2
  br label %31

31:                                               ; preds = %87, %29
  %32 = phi i32 [ 0, %29 ], [ %88, %87 ]
  %33 = phi i32 [ %26, %29 ], [ %62, %87 ]
  %34 = phi i32 [ 0, %29 ], [ %89, %87 ]
  %35 = phi i32 [ 0, %29 ], [ %90, %87 ]
  %36 = zext i32 %34 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !5
  %39 = fcmp contract ule float %38, %23
  %40 = sext i32 %33 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %3, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = fcmp contract ogt float %42, %23
  %44 = xor i1 %39, %43
  br i1 %44, label %60, label %45

45:                                               ; preds = %31
  %46 = getelementptr inbounds float, float addrspace(1)* %2, i64 %40
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %36
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !5
  %50 = fsub contract float %47, %49
  %51 = fsub contract float %23, %38
  %52 = fmul contract float %51, %50
  %53 = fsub contract float %42, %38
  %54 = fdiv contract float %52, %53
  %55 = fadd contract float %49, %54
  %56 = fcmp contract olt float %21, %55
  %57 = icmp eq i32 %32, 0
  %58 = zext i1 %57 to i32
  %59 = select i1 %56, i32 %58, i32 %32
  br label %60

60:                                               ; preds = %45, %31
  %61 = phi i32 [ %32, %31 ], [ %59, %45 ]
  %62 = or i32 %34, 1
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %3, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !5
  %66 = fcmp contract ule float %65, %23
  %67 = zext i32 %34 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %3, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !5
  %70 = fcmp contract ogt float %69, %23
  %71 = xor i1 %66, %70
  br i1 %71, label %87, label %72

72:                                               ; preds = %60
  %73 = getelementptr inbounds float, float addrspace(1)* %2, i64 %67
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7, !amdgpu.noclobber !5
  %75 = getelementptr inbounds float, float addrspace(1)* %2, i64 %63
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = fsub contract float %74, %76
  %78 = fsub contract float %23, %65
  %79 = fmul contract float %78, %77
  %80 = fsub contract float %69, %65
  %81 = fdiv contract float %79, %80
  %82 = fadd contract float %76, %81
  %83 = fcmp contract olt float %21, %82
  %84 = icmp eq i32 %61, 0
  %85 = zext i1 %84 to i32
  %86 = select i1 %83, i32 %85, i32 %61
  br label %87

87:                                               ; preds = %72, %60
  %88 = phi i32 [ %61, %60 ], [ %86, %72 ]
  %89 = add nuw nsw i32 %34, 2
  %90 = add i32 %35, 2
  %91 = icmp eq i32 %90, %30
  br i1 %91, label %92, label %31, !llvm.loop !11

92:                                               ; preds = %87
  %93 = zext i32 %89 to i64
  br label %94

94:                                               ; preds = %92, %25
  %95 = phi i32 [ undef, %25 ], [ %88, %92 ]
  %96 = phi i32 [ 0, %25 ], [ %88, %92 ]
  %97 = phi i32 [ %26, %25 ], [ %62, %92 ]
  %98 = phi i64 [ 0, %25 ], [ %93, %92 ]
  %99 = icmp eq i32 %27, 0
  br i1 %99, label %124, label %100

100:                                              ; preds = %94
  %101 = getelementptr inbounds float, float addrspace(1)* %3, i64 %98
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = fcmp contract ule float %102, %23
  %104 = sext i32 %97 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %3, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = fcmp contract ogt float %106, %23
  %108 = xor i1 %103, %107
  br i1 %108, label %124, label %109

109:                                              ; preds = %100
  %110 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !7, !amdgpu.noclobber !5
  %112 = getelementptr inbounds float, float addrspace(1)* %2, i64 %98
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !5
  %114 = fsub contract float %111, %113
  %115 = fsub contract float %23, %102
  %116 = fmul contract float %115, %114
  %117 = fsub contract float %106, %102
  %118 = fdiv contract float %116, %117
  %119 = fadd contract float %113, %118
  %120 = fcmp contract olt float %21, %119
  %121 = icmp eq i32 %96, 0
  %122 = zext i1 %121 to i32
  %123 = select i1 %120, i32 %122, i32 %96
  br label %124

124:                                              ; preds = %94, %109, %100, %18
  %125 = phi i32 [ 0, %18 ], [ %95, %94 ], [ %96, %100 ], [ %123, %109 ]
  %126 = trunc i32 %125 to i8
  %127 = and i8 %126, 1
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 %19
  store i8 %127, i8 addrspace(1)* %128, align 1, !tbaa !13
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %129

129:                                              ; preds = %124, %7
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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!9, !9, i64 0}
