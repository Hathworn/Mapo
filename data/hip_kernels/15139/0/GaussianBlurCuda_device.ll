; ModuleID = '../data/hip_kernels/15139/0/main.cu'
source_filename = "../data/hip_kernels/15139/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16GaussianBlurCudaPhS_PdPi(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = bitcast i32 addrspace(1)* %3 to <2 x i32> addrspace(1)*
  %15 = load <2 x i32>, <2 x i32> addrspace(1)* %14, align 4, !tbaa !7
  %16 = extractelement <2 x i32> %15, i64 0
  %17 = extractelement <2 x i32> %15, i64 1
  %18 = mul nsw i32 %17, %16
  %19 = icmp sge i32 %13, %18
  %20 = icmp slt i32 %13, 0
  %21 = or i1 %19, %20
  br i1 %21, label %174, label %22

22:                                               ; preds = %4
  %23 = freeze i32 %13
  %24 = freeze i32 %16
  %25 = sdiv i32 %23, %24
  %26 = mul i32 %25, %24
  %27 = sub i32 %23, %26
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 2
  %29 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !5
  %30 = sdiv i32 %29, 2
  %31 = icmp sge i32 %25, %30
  %32 = sub nsw i32 %17, %30
  %33 = icmp slt i32 %25, %32
  %34 = select i1 %31, i1 %33, i1 false
  br i1 %34, label %35, label %174

35:                                               ; preds = %22
  %36 = icmp sge i32 %27, %30
  %37 = sub nsw i32 %16, %30
  %38 = icmp slt i32 %27, %37
  %39 = select i1 %36, i1 %38, i1 false
  br i1 %39, label %40, label %174

40:                                               ; preds = %35
  %41 = icmp eq i32 %29, 0
  br i1 %41, label %97, label %42

42:                                               ; preds = %40
  %43 = mul i32 %29, %29
  %44 = sub i32 %25, %30
  %45 = sub i32 %27, %30
  %46 = tail call i32 @llvm.umax.i32(i32 %43, i32 1)
  %47 = and i32 %46, 1
  %48 = icmp ult i32 %43, 2
  br i1 %48, label %51, label %49

49:                                               ; preds = %42
  %50 = and i32 %46, -2
  br label %106

51:                                               ; preds = %106, %42
  %52 = phi double [ undef, %42 ], [ %160, %106 ]
  %53 = phi double [ undef, %42 ], [ %165, %106 ]
  %54 = phi double [ undef, %42 ], [ %170, %106 ]
  %55 = phi i32 [ 0, %42 ], [ %171, %106 ]
  %56 = phi double [ 0.000000e+00, %42 ], [ %160, %106 ]
  %57 = phi double [ 0.000000e+00, %42 ], [ %165, %106 ]
  %58 = phi double [ 0.000000e+00, %42 ], [ %170, %106 ]
  %59 = icmp eq i32 %47, 0
  br i1 %59, label %90, label %60

60:                                               ; preds = %51
  %61 = freeze i32 %55
  %62 = freeze i32 %29
  %63 = sdiv i32 %61, %62
  %64 = mul i32 %63, %62
  %65 = sub i32 %61, %64
  %66 = add i32 %44, %63
  %67 = mul nsw i32 %66, %16
  %68 = add i32 %45, %65
  %69 = add i32 %68, %67
  %70 = mul nsw i32 %69, 3
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !11, !amdgpu.noclobber !5
  %74 = uitofp i8 %73 to double
  %75 = zext i32 %55 to i64
  %76 = getelementptr inbounds double, double addrspace(1)* %2, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !12, !amdgpu.noclobber !5
  %78 = fmul contract double %77, %74
  %79 = fadd contract double %56, %78
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %72, i64 1
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !11, !amdgpu.noclobber !5
  %82 = uitofp i8 %81 to double
  %83 = fmul contract double %77, %82
  %84 = fadd contract double %57, %83
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %72, i64 2
  %86 = load i8, i8 addrspace(1)* %85, align 1, !tbaa !11, !amdgpu.noclobber !5
  %87 = uitofp i8 %86 to double
  %88 = fmul contract double %77, %87
  %89 = fadd contract double %58, %88
  br label %90

90:                                               ; preds = %51, %60
  %91 = phi double [ %52, %51 ], [ %79, %60 ]
  %92 = phi double [ %53, %51 ], [ %84, %60 ]
  %93 = phi double [ %54, %51 ], [ %89, %60 ]
  %94 = fptoui double %91 to i8
  %95 = fptoui double %92 to i8
  %96 = fptoui double %93 to i8
  br label %97

97:                                               ; preds = %90, %40
  %98 = phi i8 [ 0, %40 ], [ %96, %90 ]
  %99 = phi i8 [ 0, %40 ], [ %95, %90 ]
  %100 = phi i8 [ 0, %40 ], [ %94, %90 ]
  %101 = mul nsw i32 %13, 3
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %102
  store i8 %100, i8 addrspace(1)* %103, align 1, !tbaa !11
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %103, i64 1
  store i8 %99, i8 addrspace(1)* %104, align 1, !tbaa !11
  %105 = getelementptr inbounds i8, i8 addrspace(1)* %103, i64 2
  store i8 %98, i8 addrspace(1)* %105, align 1, !tbaa !11
  br label %174

106:                                              ; preds = %106, %49
  %107 = phi i32 [ 0, %49 ], [ %171, %106 ]
  %108 = phi double [ 0.000000e+00, %49 ], [ %160, %106 ]
  %109 = phi double [ 0.000000e+00, %49 ], [ %165, %106 ]
  %110 = phi double [ 0.000000e+00, %49 ], [ %170, %106 ]
  %111 = phi i32 [ 0, %49 ], [ %172, %106 ]
  %112 = freeze i32 %107
  %113 = freeze i32 %29
  %114 = sdiv i32 %112, %113
  %115 = mul i32 %114, %113
  %116 = sub i32 %112, %115
  %117 = add i32 %44, %114
  %118 = mul nsw i32 %117, %16
  %119 = add i32 %45, %116
  %120 = add i32 %119, %118
  %121 = mul nsw i32 %120, 3
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %122
  %124 = load i8, i8 addrspace(1)* %123, align 1, !tbaa !11, !amdgpu.noclobber !5
  %125 = uitofp i8 %124 to double
  %126 = zext i32 %107 to i64
  %127 = getelementptr inbounds double, double addrspace(1)* %2, i64 %126
  %128 = load double, double addrspace(1)* %127, align 8, !tbaa !12, !amdgpu.noclobber !5
  %129 = fmul contract double %128, %125
  %130 = fadd contract double %108, %129
  %131 = getelementptr inbounds i8, i8 addrspace(1)* %123, i64 1
  %132 = load i8, i8 addrspace(1)* %131, align 1, !tbaa !11, !amdgpu.noclobber !5
  %133 = uitofp i8 %132 to double
  %134 = fmul contract double %128, %133
  %135 = fadd contract double %109, %134
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %123, i64 2
  %137 = load i8, i8 addrspace(1)* %136, align 1, !tbaa !11, !amdgpu.noclobber !5
  %138 = uitofp i8 %137 to double
  %139 = fmul contract double %128, %138
  %140 = fadd contract double %110, %139
  %141 = or i32 %107, 1
  %142 = freeze i32 %141
  %143 = freeze i32 %29
  %144 = sdiv i32 %142, %143
  %145 = mul i32 %144, %143
  %146 = sub i32 %142, %145
  %147 = add i32 %44, %144
  %148 = mul nsw i32 %147, %16
  %149 = add i32 %45, %146
  %150 = add i32 %149, %148
  %151 = mul nsw i32 %150, 3
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %152
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !11, !amdgpu.noclobber !5
  %155 = uitofp i8 %154 to double
  %156 = zext i32 %141 to i64
  %157 = getelementptr inbounds double, double addrspace(1)* %2, i64 %156
  %158 = load double, double addrspace(1)* %157, align 8, !tbaa !12, !amdgpu.noclobber !5
  %159 = fmul contract double %158, %155
  %160 = fadd contract double %130, %159
  %161 = getelementptr inbounds i8, i8 addrspace(1)* %153, i64 1
  %162 = load i8, i8 addrspace(1)* %161, align 1, !tbaa !11, !amdgpu.noclobber !5
  %163 = uitofp i8 %162 to double
  %164 = fmul contract double %158, %163
  %165 = fadd contract double %135, %164
  %166 = getelementptr inbounds i8, i8 addrspace(1)* %153, i64 2
  %167 = load i8, i8 addrspace(1)* %166, align 1, !tbaa !11, !amdgpu.noclobber !5
  %168 = uitofp i8 %167 to double
  %169 = fmul contract double %158, %168
  %170 = fadd contract double %140, %169
  %171 = add nuw nsw i32 %107, 2
  %172 = add i32 %111, 2
  %173 = icmp eq i32 %172, %50
  br i1 %173, label %51, label %106, !llvm.loop !14

174:                                              ; preds = %97, %22, %35, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!11 = !{!9, !9, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"double", !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
