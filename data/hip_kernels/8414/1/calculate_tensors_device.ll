; ModuleID = '../data/hip_kernels/8414/1/main.cu'
source_filename = "../data/hip_kernels/8414/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z17calculate_tensorsPfPKfS1_ii(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = mul i32 %3, %3
  %16 = mul i32 %15, %15
  %17 = mul nsw i32 %4, %3
  %18 = icmp ult i32 %14, %16
  br i1 %18, label %19, label %197

19:                                               ; preds = %5
  %20 = freeze i32 %14
  %21 = freeze i32 %3
  %22 = udiv i32 %20, %21
  %23 = mul i32 %22, %21
  %24 = sub i32 %20, %23
  %25 = freeze i32 %3
  %26 = udiv i32 %22, %25
  %27 = mul i32 %26, %25
  %28 = sub i32 %22, %27
  %29 = freeze i32 %3
  %30 = udiv i32 %26, %29
  %31 = mul i32 %30, %29
  %32 = sub i32 %26, %31
  %33 = icmp sgt i32 %4, 0
  %34 = zext i32 %14 to i64
  br i1 %33, label %35, label %45

35:                                               ; preds = %19
  %36 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %37 = and i32 %4, 3
  %38 = icmp ult i32 %4, 4
  %39 = and i32 %4, -4
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %35, %96
  %42 = phi i32 [ 0, %35 ], [ %97, %96 ]
  %43 = mul nsw i32 %42, %3
  %44 = load float, float addrspace(1)* %36, align 4, !tbaa !7
  br i1 %38, label %64, label %99

45:                                               ; preds = %96, %19
  %46 = zext i32 %24 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !7
  %49 = zext i32 %28 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %2, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7
  %52 = fmul contract float %48, %51
  %53 = zext i32 %32 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %2, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7
  %56 = fmul contract float %52, %55
  %57 = zext i32 %30 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %2, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !7
  %60 = fmul contract float %56, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7
  %63 = fdiv contract float %62, %60
  store float %63, float addrspace(1)* %61, align 4, !tbaa !7
  br label %197

64:                                               ; preds = %99, %41
  %65 = phi float [ %44, %41 ], [ %193, %99 ]
  %66 = phi i32 [ 0, %41 ], [ %194, %99 ]
  br i1 %40, label %96, label %67

67:                                               ; preds = %64, %67
  %68 = phi float [ %92, %67 ], [ %65, %64 ]
  %69 = phi i32 [ %93, %67 ], [ %66, %64 ]
  %70 = phi i32 [ %94, %67 ], [ 0, %64 ]
  %71 = mul i32 %17, %69
  %72 = add i32 %71, %43
  %73 = add i32 %72, %24
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, float addrspace(1)* %1, i64 %74
  %76 = load float, float addrspace(1)* %75, align 4, !tbaa !7
  %77 = add i32 %72, %28
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %1, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fmul contract float %76, %80
  %82 = add i32 %72, %32
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %1, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = fmul contract float %81, %85
  %87 = add i32 %72, %30
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %1, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !7
  %91 = fmul contract float %86, %90
  %92 = fadd contract float %68, %91
  store float %92, float addrspace(1)* %36, align 4, !tbaa !7
  %93 = add nuw nsw i32 %69, 1
  %94 = add i32 %70, 1
  %95 = icmp eq i32 %94, %37
  br i1 %95, label %96, label %67, !llvm.loop !11

96:                                               ; preds = %67, %64
  %97 = add nuw nsw i32 %42, 1
  %98 = icmp eq i32 %97, %4
  br i1 %98, label %45, label %41, !llvm.loop !13

99:                                               ; preds = %41, %99
  %100 = phi float [ %193, %99 ], [ %44, %41 ]
  %101 = phi i32 [ %194, %99 ], [ 0, %41 ]
  %102 = phi i32 [ %195, %99 ], [ 0, %41 ]
  %103 = mul i32 %17, %101
  %104 = add i32 %103, %43
  %105 = add i32 %104, %24
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = add i32 %104, %28
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds float, float addrspace(1)* %1, i64 %110
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7
  %113 = fmul contract float %108, %112
  %114 = add i32 %104, %32
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %1, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7
  %118 = fmul contract float %113, %117
  %119 = add i32 %104, %30
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %1, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fmul contract float %118, %122
  %124 = fadd contract float %100, %123
  store float %124, float addrspace(1)* %36, align 4, !tbaa !7
  %125 = or i32 %101, 1
  %126 = mul i32 %17, %125
  %127 = add i32 %126, %43
  %128 = add i32 %127, %24
  %129 = zext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %1, i64 %129
  %131 = load float, float addrspace(1)* %130, align 4, !tbaa !7
  %132 = add i32 %127, %28
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %1, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = fmul contract float %131, %135
  %137 = add i32 %127, %32
  %138 = zext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %1, i64 %138
  %140 = load float, float addrspace(1)* %139, align 4, !tbaa !7
  %141 = fmul contract float %136, %140
  %142 = add i32 %127, %30
  %143 = zext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %1, i64 %143
  %145 = load float, float addrspace(1)* %144, align 4, !tbaa !7
  %146 = fmul contract float %141, %145
  %147 = fadd contract float %124, %146
  store float %147, float addrspace(1)* %36, align 4, !tbaa !7
  %148 = or i32 %101, 2
  %149 = mul i32 %17, %148
  %150 = add i32 %149, %43
  %151 = add i32 %150, %24
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %1, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !7
  %155 = add i32 %150, %28
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %1, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !7
  %159 = fmul contract float %154, %158
  %160 = add i32 %150, %32
  %161 = zext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %1, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !7
  %164 = fmul contract float %159, %163
  %165 = add i32 %150, %30
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds float, float addrspace(1)* %1, i64 %166
  %168 = load float, float addrspace(1)* %167, align 4, !tbaa !7
  %169 = fmul contract float %164, %168
  %170 = fadd contract float %147, %169
  store float %170, float addrspace(1)* %36, align 4, !tbaa !7
  %171 = or i32 %101, 3
  %172 = mul i32 %17, %171
  %173 = add i32 %172, %43
  %174 = add i32 %173, %24
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %1, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !7
  %178 = add i32 %173, %28
  %179 = zext i32 %178 to i64
  %180 = getelementptr inbounds float, float addrspace(1)* %1, i64 %179
  %181 = load float, float addrspace(1)* %180, align 4, !tbaa !7
  %182 = fmul contract float %177, %181
  %183 = add i32 %173, %32
  %184 = zext i32 %183 to i64
  %185 = getelementptr inbounds float, float addrspace(1)* %1, i64 %184
  %186 = load float, float addrspace(1)* %185, align 4, !tbaa !7
  %187 = fmul contract float %182, %186
  %188 = add i32 %173, %30
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds float, float addrspace(1)* %1, i64 %189
  %191 = load float, float addrspace(1)* %190, align 4, !tbaa !7
  %192 = fmul contract float %187, %191
  %193 = fadd contract float %170, %192
  store float %193, float addrspace(1)* %36, align 4, !tbaa !7
  %194 = add nuw nsw i32 %101, 4
  %195 = add i32 %102, 4
  %196 = icmp eq i32 %195, %39
  br i1 %196, label %64, label %99, !llvm.loop !15

197:                                              ; preds = %5, %45
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !14}
