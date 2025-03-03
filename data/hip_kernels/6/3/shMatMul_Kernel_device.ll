; ModuleID = '../data/hip_kernels/6/3/main.cu'
source_filename = "../data/hip_kernels/6/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sh_Mem = external hidden local_unnamed_addr addrspace(3) global [0 x float], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15shMatMul_KerneliPfS_S_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %6, %10
  %12 = mul nuw nsw i32 %10, %10
  %13 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %11, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %5, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %0
  %25 = add nsw i32 %24, %15
  %26 = icmp slt i32 %15, %0
  %27 = icmp slt i32 %23, %0
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %170

29:                                               ; preds = %4
  %30 = sdiv i32 %0, %10
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %42

32:                                               ; preds = %29
  %33 = add i32 %24, %14
  %34 = mul nuw nsw i32 %22, %10
  %35 = add nuw nsw i32 %34, %14
  %36 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %35
  %37 = getelementptr inbounds float, float addrspace(3)* %13, i32 %35
  %38 = and i32 %10, 7
  %39 = icmp ult i16 %9, 8
  %40 = and i32 %10, 2040
  %41 = icmp eq i32 %38, 0
  br label %46

42:                                               ; preds = %80, %29
  %43 = phi float [ 0.000000e+00, %29 ], [ %81, %80 ]
  %44 = sext i32 %25 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %3, i64 %44
  store float %43, float addrspace(1)* %45, align 4, !tbaa !7
  br label %170

46:                                               ; preds = %32, %80
  %47 = phi i32 [ 0, %32 ], [ %82, %80 ]
  %48 = phi float [ 0.000000e+00, %32 ], [ %81, %80 ]
  %49 = mul nuw nsw i32 %47, %10
  %50 = add i32 %33, %49
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %1, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %53, float addrspace(3)* %36, align 4, !tbaa !7
  %54 = add nuw i32 %49, %22
  %55 = mul i32 %54, %0
  %56 = add i32 %55, %15
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !5
  store float %59, float addrspace(3)* %37, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %39, label %60, label %84

60:                                               ; preds = %84, %46
  %61 = phi float [ undef, %46 ], [ %166, %84 ]
  %62 = phi i32 [ 0, %46 ], [ %167, %84 ]
  %63 = phi float [ %48, %46 ], [ %166, %84 ]
  br i1 %41, label %80, label %64

64:                                               ; preds = %60, %64
  %65 = phi i32 [ %77, %64 ], [ %62, %60 ]
  %66 = phi float [ %76, %64 ], [ %63, %60 ]
  %67 = phi i32 [ %78, %64 ], [ 0, %60 ]
  %68 = add nuw nsw i32 %65, %34
  %69 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %68
  %70 = load float, float addrspace(3)* %69, align 4, !tbaa !7
  %71 = mul nuw nsw i32 %65, %10
  %72 = add nuw nsw i32 %71, %14
  %73 = getelementptr inbounds float, float addrspace(3)* %13, i32 %72
  %74 = load float, float addrspace(3)* %73, align 4, !tbaa !7
  %75 = fmul contract float %70, %74
  %76 = fadd contract float %66, %75
  %77 = add nuw nsw i32 %65, 1
  %78 = add i32 %67, 1
  %79 = icmp eq i32 %78, %38
  br i1 %79, label %80, label %64, !llvm.loop !11

80:                                               ; preds = %64, %60
  %81 = phi float [ %61, %60 ], [ %76, %64 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = add nuw nsw i32 %47, 1
  %83 = icmp eq i32 %82, %30
  br i1 %83, label %42, label %46, !llvm.loop !13

84:                                               ; preds = %46, %84
  %85 = phi i32 [ %167, %84 ], [ 0, %46 ]
  %86 = phi float [ %166, %84 ], [ %48, %46 ]
  %87 = phi i32 [ %168, %84 ], [ 0, %46 ]
  %88 = add nuw nsw i32 %85, %34
  %89 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !7
  %91 = mul nuw nsw i32 %85, %10
  %92 = add nuw nsw i32 %91, %14
  %93 = getelementptr inbounds float, float addrspace(3)* %13, i32 %92
  %94 = load float, float addrspace(3)* %93, align 4, !tbaa !7
  %95 = fmul contract float %90, %94
  %96 = fadd contract float %86, %95
  %97 = or i32 %85, 1
  %98 = add nuw nsw i32 %97, %34
  %99 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %98
  %100 = load float, float addrspace(3)* %99, align 4, !tbaa !7
  %101 = mul nuw nsw i32 %97, %10
  %102 = add nuw nsw i32 %101, %14
  %103 = getelementptr inbounds float, float addrspace(3)* %13, i32 %102
  %104 = load float, float addrspace(3)* %103, align 4, !tbaa !7
  %105 = fmul contract float %100, %104
  %106 = fadd contract float %96, %105
  %107 = or i32 %85, 2
  %108 = add nuw nsw i32 %107, %34
  %109 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %108
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !7
  %111 = mul nuw nsw i32 %107, %10
  %112 = add nuw nsw i32 %111, %14
  %113 = getelementptr inbounds float, float addrspace(3)* %13, i32 %112
  %114 = load float, float addrspace(3)* %113, align 4, !tbaa !7
  %115 = fmul contract float %110, %114
  %116 = fadd contract float %106, %115
  %117 = or i32 %85, 3
  %118 = add nuw nsw i32 %117, %34
  %119 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %118
  %120 = load float, float addrspace(3)* %119, align 4, !tbaa !7
  %121 = mul nuw nsw i32 %117, %10
  %122 = add nuw nsw i32 %121, %14
  %123 = getelementptr inbounds float, float addrspace(3)* %13, i32 %122
  %124 = load float, float addrspace(3)* %123, align 4, !tbaa !7
  %125 = fmul contract float %120, %124
  %126 = fadd contract float %116, %125
  %127 = or i32 %85, 4
  %128 = add nuw nsw i32 %127, %34
  %129 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %128
  %130 = load float, float addrspace(3)* %129, align 4, !tbaa !7
  %131 = mul nuw nsw i32 %127, %10
  %132 = add nuw nsw i32 %131, %14
  %133 = getelementptr inbounds float, float addrspace(3)* %13, i32 %132
  %134 = load float, float addrspace(3)* %133, align 4, !tbaa !7
  %135 = fmul contract float %130, %134
  %136 = fadd contract float %126, %135
  %137 = or i32 %85, 5
  %138 = add nuw nsw i32 %137, %34
  %139 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %138
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !7
  %141 = mul nuw nsw i32 %137, %10
  %142 = add nuw nsw i32 %141, %14
  %143 = getelementptr inbounds float, float addrspace(3)* %13, i32 %142
  %144 = load float, float addrspace(3)* %143, align 4, !tbaa !7
  %145 = fmul contract float %140, %144
  %146 = fadd contract float %136, %145
  %147 = or i32 %85, 6
  %148 = add nuw nsw i32 %147, %34
  %149 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %148
  %150 = load float, float addrspace(3)* %149, align 4, !tbaa !7
  %151 = mul nuw nsw i32 %147, %10
  %152 = add nuw nsw i32 %151, %14
  %153 = getelementptr inbounds float, float addrspace(3)* %13, i32 %152
  %154 = load float, float addrspace(3)* %153, align 4, !tbaa !7
  %155 = fmul contract float %150, %154
  %156 = fadd contract float %146, %155
  %157 = or i32 %85, 7
  %158 = add nuw nsw i32 %157, %34
  %159 = getelementptr inbounds [0 x float], [0 x float] addrspace(3)* @sh_Mem, i32 0, i32 %158
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !7
  %161 = mul nuw nsw i32 %157, %10
  %162 = add nuw nsw i32 %161, %14
  %163 = getelementptr inbounds float, float addrspace(3)* %13, i32 %162
  %164 = load float, float addrspace(3)* %163, align 4, !tbaa !7
  %165 = fmul contract float %160, %164
  %166 = fadd contract float %156, %165
  %167 = add nuw nsw i32 %85, 8
  %168 = add i32 %87, 8
  %169 = icmp eq i32 %168, %40
  br i1 %169, label %60, label %84, !llvm.loop !15

170:                                              ; preds = %42, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
