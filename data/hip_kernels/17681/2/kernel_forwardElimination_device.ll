; ModuleID = '../data/hip_kernels/17681/2/main.cu'
source_filename = "../data/hip_kernels/17681/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z25kernel_forwardEliminationPfS_j(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = mul i32 %4, %2
  %6 = mul i32 %5, %2
  %7 = add i32 %2, -1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %191, label %9

9:                                                ; preds = %3
  %10 = and i32 %2, 7
  %11 = icmp ult i32 %2, 8
  %12 = and i32 %2, -8
  %13 = icmp eq i32 %10, 0
  br label %16

14:                                               ; preds = %178, %16
  %15 = icmp eq i32 %18, %7
  br i1 %15, label %191, label %16, !llvm.loop !5

16:                                               ; preds = %9, %14
  %17 = phi i32 [ %18, %14 ], [ 0, %9 ]
  %18 = add nuw i32 %17, 1
  %19 = icmp ult i32 %18, %2
  br i1 %19, label %20, label %14

20:                                               ; preds = %16
  %21 = mul i32 %17, %2
  %22 = add i32 %21, %6
  %23 = add i32 %22, %17
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %26 = add i32 %17, %6
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  br label %29

29:                                               ; preds = %20, %178
  %30 = phi i32 [ %18, %20 ], [ %189, %178 ]
  %31 = mul i32 %30, %2
  %32 = add i32 %31, %6
  %33 = add i32 %32, %17
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %0, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7
  %37 = load float, float addrspace(1)* %25, align 4, !tbaa !7
  %38 = fdiv contract float %36, %37
  %39 = fpext float %38 to double
  br i1 %11, label %157, label %40

40:                                               ; preds = %29, %40
  %41 = phi i32 [ %154, %40 ], [ 0, %29 ]
  %42 = phi i32 [ %155, %40 ], [ 0, %29 ]
  %43 = add i32 %41, %22
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %0, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !7
  %47 = fpext float %46 to double
  %48 = fmul contract double %39, %47
  %49 = add i32 %41, %32
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %50
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7
  %53 = fpext float %52 to double
  %54 = fsub contract double %53, %48
  %55 = fptrunc double %54 to float
  store float %55, float addrspace(1)* %51, align 4, !tbaa !7
  %56 = or i32 %41, 1
  %57 = add i32 %56, %22
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %0, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7
  %61 = fpext float %60 to double
  %62 = fmul contract double %39, %61
  %63 = add i32 %56, %32
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %0, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7
  %67 = fpext float %66 to double
  %68 = fsub contract double %67, %62
  %69 = fptrunc double %68 to float
  store float %69, float addrspace(1)* %65, align 4, !tbaa !7
  %70 = or i32 %41, 2
  %71 = add i32 %70, %22
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds float, float addrspace(1)* %0, i64 %72
  %74 = load float, float addrspace(1)* %73, align 4, !tbaa !7
  %75 = fpext float %74 to double
  %76 = fmul contract double %39, %75
  %77 = add i32 %70, %32
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !7
  %81 = fpext float %80 to double
  %82 = fsub contract double %81, %76
  %83 = fptrunc double %82 to float
  store float %83, float addrspace(1)* %79, align 4, !tbaa !7
  %84 = or i32 %41, 3
  %85 = add i32 %84, %22
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %0, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !7
  %89 = fpext float %88 to double
  %90 = fmul contract double %39, %89
  %91 = add i32 %84, %32
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %0, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  %95 = fpext float %94 to double
  %96 = fsub contract double %95, %90
  %97 = fptrunc double %96 to float
  store float %97, float addrspace(1)* %93, align 4, !tbaa !7
  %98 = or i32 %41, 4
  %99 = add i32 %98, %22
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %0, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7
  %103 = fpext float %102 to double
  %104 = fmul contract double %39, %103
  %105 = add i32 %98, %32
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !7
  %109 = fpext float %108 to double
  %110 = fsub contract double %109, %104
  %111 = fptrunc double %110 to float
  store float %111, float addrspace(1)* %107, align 4, !tbaa !7
  %112 = or i32 %41, 5
  %113 = add i32 %112, %22
  %114 = zext i32 %113 to i64
  %115 = getelementptr inbounds float, float addrspace(1)* %0, i64 %114
  %116 = load float, float addrspace(1)* %115, align 4, !tbaa !7
  %117 = fpext float %116 to double
  %118 = fmul contract double %39, %117
  %119 = add i32 %112, %32
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %0, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7
  %123 = fpext float %122 to double
  %124 = fsub contract double %123, %118
  %125 = fptrunc double %124 to float
  store float %125, float addrspace(1)* %121, align 4, !tbaa !7
  %126 = or i32 %41, 6
  %127 = add i32 %126, %22
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !7
  %131 = fpext float %130 to double
  %132 = fmul contract double %39, %131
  %133 = add i32 %126, %32
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds float, float addrspace(1)* %0, i64 %134
  %136 = load float, float addrspace(1)* %135, align 4, !tbaa !7
  %137 = fpext float %136 to double
  %138 = fsub contract double %137, %132
  %139 = fptrunc double %138 to float
  store float %139, float addrspace(1)* %135, align 4, !tbaa !7
  %140 = or i32 %41, 7
  %141 = add i32 %140, %22
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds float, float addrspace(1)* %0, i64 %142
  %144 = load float, float addrspace(1)* %143, align 4, !tbaa !7
  %145 = fpext float %144 to double
  %146 = fmul contract double %39, %145
  %147 = add i32 %140, %32
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds float, float addrspace(1)* %0, i64 %148
  %150 = load float, float addrspace(1)* %149, align 4, !tbaa !7
  %151 = fpext float %150 to double
  %152 = fsub contract double %151, %146
  %153 = fptrunc double %152 to float
  store float %153, float addrspace(1)* %149, align 4, !tbaa !7
  %154 = add nuw i32 %41, 8
  %155 = add i32 %42, 8
  %156 = icmp eq i32 %155, %12
  br i1 %156, label %157, label %40, !llvm.loop !11

157:                                              ; preds = %40, %29
  %158 = phi i32 [ 0, %29 ], [ %154, %40 ]
  br i1 %13, label %178, label %159

159:                                              ; preds = %157, %159
  %160 = phi i32 [ %175, %159 ], [ %158, %157 ]
  %161 = phi i32 [ %176, %159 ], [ 0, %157 ]
  %162 = add i32 %160, %22
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %0, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !7
  %166 = fpext float %165 to double
  %167 = fmul contract double %39, %166
  %168 = add i32 %160, %32
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %0, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !7
  %172 = fpext float %171 to double
  %173 = fsub contract double %172, %167
  %174 = fptrunc double %173 to float
  store float %174, float addrspace(1)* %170, align 4, !tbaa !7
  %175 = add nuw i32 %160, 1
  %176 = add i32 %161, 1
  %177 = icmp eq i32 %176, %10
  br i1 %177, label %178, label %159, !llvm.loop !12

178:                                              ; preds = %159, %157
  %179 = load float, float addrspace(1)* %28, align 4, !tbaa !7
  %180 = fpext float %179 to double
  %181 = fmul contract double %39, %180
  %182 = add i32 %30, %6
  %183 = zext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %1, i64 %183
  %185 = load float, float addrspace(1)* %184, align 4, !tbaa !7
  %186 = fpext float %185 to double
  %187 = fsub contract double %186, %181
  %188 = fptrunc double %187 to float
  store float %188, float addrspace(1)* %184, align 4, !tbaa !7
  %189 = add i32 %30, 1
  %190 = icmp ult i32 %189, %2
  br i1 %190, label %29, label %14, !llvm.loop !14

191:                                              ; preds = %14, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !6}
